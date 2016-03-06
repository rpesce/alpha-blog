class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show, :update, :destroy]
  
  def new
    @article = Article.new
  end
  
  def index
    @articles = Article.all
  end
  
  def edit
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "The article was created"
      redirect_to article_path(@article)  
    else
      render 'new'
    end
  end

def show
end

def update
  if @article.update(article_params)
    flash[:notice] = "Your article was updated"
    redirect_to article_path(@article)
  else
    render 'edit'
  end
end

def destroy
  @article.destroy
  flash[:notice] = "Article deleted"
  redirect_to articles_path
end
  
  private
  
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
end