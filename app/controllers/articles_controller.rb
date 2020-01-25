class ArticlesController < ApplicationController

before_action :article_set, only: [:destroy, :show, :edit, :update]

def new
	@article = Article.new
end

def show
	
end


def index
 @articles = Article.all
end


def create

	@article = Article.new(article_params)
	if @article.save
		flash[:success] = 'The article was created'
		redirect_to article_path(@article)
	else
		render 'new'
	end	
end

def edit

end

def update
	if @article.update(article_params)
		flash[:success] = 'The article was updated'
		redirect_to article_path(@article)
	else
		render 'edit'
	end	
end

def destroy
	@article.destroy
	flash[:danger] = "Article was deleted"
	redirect_to articles_path
end

private

def article_set
	@article = Article.find(params[:id])
end

def article_params
	params.require(:article).permit(:title, :description)
end

end