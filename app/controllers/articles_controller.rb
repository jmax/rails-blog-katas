class ArticlesController < ApplicationController
  expose(:articles)
  expose(:article, attributes: :article_params)

  def index
    self.articles = Article.published.latest(10)
  end

  def show; end

  def new; end

  def create
    if article.save
      redirect_to_index_with_message("Article created!")
    else
      render :new
    end
  end

  def edit; end

  def update
    if article.update_attributes(article_params)
      redirect_to_index_with_message("Article updated!")
    else
      render :edit
    end
  end

  def destroy
    article.destroy

    redirect_to_index_with_message("Article removed!")
  end

protected

  def article_params
    params.require(:article).permit(:title, :body, :published_at)
  end

  def redirect_to_index_with_message(msg)
    redirect_to articles_path, notice: msg
  end

end
