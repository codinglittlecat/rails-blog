module Mutations
  class CreateComment < BaseMutation
    argument :article_id, ID, required: true
    argument :body, String, required: true
    argument :status, String, required: false

    type Types::CommentType

    def resolve(article_id: nil, body: nil, status: nil)
      Comment.create!(
        article: Article.find(article_id),
        body: body,
        user: context[:current_user],
        status: status
      )
    end
  end
end
