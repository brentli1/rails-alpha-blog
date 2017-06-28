require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  def setup
    @user = User.create(username: 'Test User', 
                        email: 'test@example.com', 
                        password: 'password')
    @article = Article.create(title: 'Test Title', 
                              description: 'Test Description', 
                              user_id: @user.id)
  end

  test 'should get articles index' do
    get :index
    assert_response :success
  end

  test 'should get new' do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test 'should get show' do
    get(:show, { 'id' => @article.id })
    assert_response :success
  end

  test 'should redirect if not logged in on article creation' do
    assert_no_difference 'Article.count' do
      post :create, article: { title: 'this will not save', 
                               description: 'this will not save' }
    end
    assert_redirected_to root_path
  end
end
