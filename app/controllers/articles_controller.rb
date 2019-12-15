class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    # raise params.inspect
    # used to raise an error message showing the params
    @article = Article.find(params[:id])
    @article.update(title: params[:article][:title], description: params[:article][:description])
    # can't use mass params without .require().permit
    redirect_to article_path(@article)
  end
  


end
