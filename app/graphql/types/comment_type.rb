module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :status, String, null: true
    field :user, Types::UserType, null: false
    field :article, Types::ArticleType, null: false
  end
end
