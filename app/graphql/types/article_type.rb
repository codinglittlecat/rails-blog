module Types
  class ArticleType < Types::BaseObject
    field :title, String, null: false
    field :body, String, null: false
    field :status, String, null: true
    field :posted_by, UserType, null: true, method: :user
  end
end
