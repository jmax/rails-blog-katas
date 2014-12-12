class ArticlesController < ApplicationController
  expose(:articles) { Article.published }

  def index; end
end
