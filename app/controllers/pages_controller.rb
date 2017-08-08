class PagesController < ApplicationController
  def home
    redirect_to articles_path if logged_in?

    @latest_blogs = Article.order('created_at DESC').limit(3)
  end

  def about
    
  end
end
