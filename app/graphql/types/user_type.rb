module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :comments, [CommentType], null: false
    field :articles, [ArticleType], null: false
  end
end
