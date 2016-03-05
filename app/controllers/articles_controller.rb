class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
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
  @article = Article.find(params[:id])
end

def update
  @article = Article.find(params[:id])
  if @article.update(article_params)
    flash[:notice] = "Your article was updated"
    redirect_to article_path(@article)
  else
    render 'edit'
  end
end
  
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
end