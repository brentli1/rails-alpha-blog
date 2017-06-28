require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = Article.new(title: 'test title',
                           description: 'test description',
                           user_id: 1)
  end

  test 'article should be valid' do
    assert @article.valid?
  end

  test 'article should have a title' do
    @article.title = ''
    assert_not @article.valid?
  end

  test 'article title should not be too short' do
    @article.title = 'aa'
    assert_not @article.valid?
  end

  test 'article title should not be too long' do
    @article.title = 'a' * 51
    assert_not @article.valid?
  end

  test 'article should have a description' do
    @article.description = ''
    assert_not @article.valid?
  end

  test 'article description should not be too short' do
    @article.description = 'aa'
    assert_not @article.valid?
  end

  test 'article description should not be too long' do
    @article.description = 'a' * 301
    assert_not @article.valid?
  end

  test 'article should have a user id' do
    @article.user_id = ''
    assert_not @article.valid?
  end
end
