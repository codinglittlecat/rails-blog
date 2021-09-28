require 'test_helper'

class Mutations::CreateArticleTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateArticle.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create a new article' do
    test_title = 'test title'
    test_body = 'test body'
    test_status = 'public'

    article = perform(
      title: test_title,
      body: test_body,
      status: test_status
    )

    assert article.persisted?
    assert_equal article.title, test_title
    assert_equal article.body, test_body
  end
end
