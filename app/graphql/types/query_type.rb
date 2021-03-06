module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
                               description: 'An example field added by the generator'
    def test_field
      'Hello World!'
    end

    field :all_articles, [ArticleType], null: false

    def all_articles
      Article.all
    end

    # searchArticles(skip: 1, limit: 2) {
    #   title
    # }

    field :search_articles, resolver: Resolvers::ArticlesSearch
  end
end
