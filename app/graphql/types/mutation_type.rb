module Types
  class MutationType < Types::BaseObject
    # mutation {
    #   createArticle(
    #     title: "test title",
    #     body: "test body text"
    #   ) {
    #     title
    #     body
    #   }
    # }

    field :create_article, mutation: Mutations::CreateArticle

    # mutation {
    #   createUser(
    #     name: "Test User",
    #     authProvider: {
    #       credentials: {
    #         email: "email@example.com",
    #         password: "123456"
    #       }
    #     }
    #   ) {
    #     id
    #     name
    #     email
    #   }
    # }

    field :create_user, mutation: Mutations::CreateUser

    # mutation {
    #   signinUser(
    #       credentials: {
    #         email: "email@example.com",
    #         password: "123456"
    #       }
    #   ) {
    #     user {
    #       name
    #       email
    #     }
    #     token
    #   }
    # }

    field :signin_user, mutation: Mutations::SignInUser

    # mutation {
    #   createComment(
    #     articleId: 2,
    #     body: "test body comment",
    #     status: "public"
    #   ) {
    #     id
    #     body
    #     user {
    #       name
    #       email
    #     }
    #     article {
    #       title
    #       body
    #     }
    #   }
    # }

    field :create_comment, mutation: Mutations::CreateComment
  end
end
