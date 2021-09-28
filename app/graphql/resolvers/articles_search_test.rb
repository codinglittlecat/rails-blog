require 'test_helper'

module Resolvers
  class ArticlesSearchTest < ActiveSupport::TestCase
    def find(args)
      ::Resolvers::ArticlesSearch.call(nil, args, nil)
    end

    # those helpers should be handled with something like `factory_bot` gem
    def create_user
      User.create name: 'test', email: 'test@example.com', password: '123456'
    end

    def create_article(**attributes)
      Article.create! attributes.merge(user: create_user)
    end

    test 'filter option' do
      article1 = create_article title: 'test1', body: 'http://test1.com'
      article2 = create_article title: 'test2', body: 'http://test2.com'
      article3 = create_article title: 'test3', body: 'http://test3.com'
      article4 = create_article title: 'test4', body: 'http://test4.com'

      result = find(
        filter: {
          title_contains: 'test1',
          OR: [{
            body_contains: 'test2',
            OR: [{
              body_contains: 'test3'
            }]
          }, {
            title_contains: 'test2'
          }]
        }
      )

      assert_equal result.map(&:title).sort, [article1, article2, article3].map(&:title).sort
    end
  end
end
