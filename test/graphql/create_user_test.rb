require 'test_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  def perform(**args)
    Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(**args)
  end

  test 'create a new user' do
    test_name = 'Test user'
    test_email = 'email@example.com'

    user = perform(
      name: test_name,
      auth_provider: {
        credentials: {
          email: test_email,
          password: '[omitted]'
        }
      }
    )

    assert user.persisted?
    assert_equal user.name, test_name
    assert_equal user.email, test_email
  end
end
