class ArticlesController < ApplicationController
  expose(:articles) { Article.published.latest(10) }

  def index; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to "/articles", notice: "Article created!"
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(article_params)
      redirect_to "/articles", notice: "Article updated!"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to "/articles", notice: "Article removed!"
  end

protected

  def article_params
    params.require(:article).permit(:title, :body, :published_at)
  end

end
