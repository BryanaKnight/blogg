class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
    render json: @article.as_json(include: :comments)
  end

  def new

  end

  def index
    @articles = Article.all
    render json: @articles.as_json(include: :comments)
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
