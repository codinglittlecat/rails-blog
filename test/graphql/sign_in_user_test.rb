require 'test_helper'

class Mutations::SignInUserTest < ActiveSupport::TestCase
  def perform(**args)
    Mutations::SignInUser.new(object: nil, field: nil, context: {}).resolve(**args)
  end

  def create_user
    # UNDERSTAND ME function!
    User.create!(
      name: 'Test User',
      email: 'email@example.com',
      password: '123456' # UNDERSTAND ME
    )
  end

  test 'success' do
    user = create_user

    result = perform(
      credentials: {
        email: user.email,
        password: user.password
      }
    )

    assert result[:token].present?
    assert_equal result[:user], user
  end

  test 'failure because no credentials' do
    assert_nil perform
  end

  test 'failure because wrong email' do
    create_user
    assert_nil perform(credentials: { email: 'wrong' })
  end

  test 'failure because woring password' do
    user = create_user
    assert_nil perform(credentials: { email: user.email, password: 'wrong' })
  end
end
