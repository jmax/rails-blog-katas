class HomeController < ApplicationController
  expose(:featured_articles) { Article.featured(Article::FEATURED_COUNT) }

  def index
  end
end
