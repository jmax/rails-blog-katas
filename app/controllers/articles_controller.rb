class ArticlesController < ApplicationController
  expose(:articles) { Article.published.latest(10) }

  def index; end
end
