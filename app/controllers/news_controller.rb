class NewsController < ApplicationController
  def index
    @news = News.fetch
  end
end