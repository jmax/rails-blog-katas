class ArticlesController < ApplicationController
  expose(:articles)
  expose(:article, attributes: :article_params)

  expose(:comments)       { article.comments }
  expose(:comment)    { comments.build }
  expose(:comments_count) { comments.count }

  def index
    self.articles = Article.published.latest(10)
  end

  def show
    self.comments = article.comments.most_recent
  end

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

  def feature
    requested_article.feature!
    redirect_to_index_with_message("Article featured!")
  end

  def unfeature
    requested_article.unfeature!
    redirect_to_index_with_message("Article unfeatured!")
  end

protected

  def requested_article
    @requested_article ||= Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :published_at)
  end

  def redirect_to_index_with_message(msg)
    redirect_to articles_path, notice: msg
  end

end
