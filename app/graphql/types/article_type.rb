module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :body, String, null: false
    field :status, String, null: true
    field :posted_by, UserType, null: true, method: :user
    field :comments, [CommentType], null: false
  end
end
