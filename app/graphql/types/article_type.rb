module Types
  class ArticleType < Types::BaseObject
    field :title, String, null: false
    field :body, String, null: false
  end
end
