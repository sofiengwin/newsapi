class NewsController < ApplicationController
  def index
    @news = News.fetch
    unless @news
      redirect_to error_path
    end
  end

  def error_page
  end
end