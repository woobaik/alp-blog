class ArticlesController < ApplicationController
  before_action :set_param, only: [:show, :edit, :update, :destroy]

  def new
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article was successfully saved'
      redirect_to root_path(@article)
    else
      render articles_new_path
    end
  end


  def index
    @articles = Article.all
  end


  def show

  end


  def edit

  end


  def update

    if @article.update(article_params)
      flash[:notice] = "Article has been successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end


  def destroy

    @article.destroy
    flash[:notice] = "Article has been successfully removed"
    redirect_to articles_path
  end

  private

    def set_param
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
