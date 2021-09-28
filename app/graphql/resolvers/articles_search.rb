require 'search_object'
require 'search_object/plugin/graphql'

class Resolvers::ArticlesSearch
  include SearchObject.module(:graphql)

  scope { Article.all }

  type types[Types::ArticleType]

  class ArticleFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :title_contains, String, required: false
    argument :body_contains, String, required: false
  end

  option :filter, type: ArticleFilter, with: :apply_filter
  option :first, type: Int, with: :apply_first
  option :skip, type: Int, with: :apply_skip

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def apply_first(scope, value)
    scope.limit value
  end

  def apply_skip(scope, value)
    scope.offset value
  end

  def normalize_filters(value, branches = [])
    scope = Article.all
    scope = scope.where('title LIKE ?', "%#{value[:title_contains]}%") if value[:title_contains]
    scope = scope.where('body LIKE ?', "%#{value[:body_contains]}%") if value[:body_contains]

    branches << scope

    value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

    branches
  end
end
