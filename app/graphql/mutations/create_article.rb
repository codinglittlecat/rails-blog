module Mutations
  class CreateArticle < BaseMutation
    argument :title, String, required: true
    argument :body, String, required: true
    argument :status, String, required: false

    type Types::ArticleType

    def resolve(title: nil, body: nil, status: nil)
      Article.create!(
        title: title,
        body: body,
        status: status,
        user: context[:current_user]
      )
    rescue ActiveRecord::RecordInavlid => e
      GraphQl::ExecutionError.new("Invalid input: #{e.record.erros.full_messages.join(', ')}")
    end
  end
end
