class CategoriesController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	before_action :admin_require, except: [:show, :index] 

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "The user #{@category.name} was created"
			redirect_to categories_path
		else
			render 'new'
		end
		
	end	

	def edit
		
	end

	def update
		if @category.update(category_params)
			flash[:success] = "The category #{@category.name} was updated"
			redirect_to category_path(@category)
		else
			render 'edit'
		end
	end

	def show
		@category_articles = @category.articles.paginate(page: params[:page], per_page: 3)
	end

	def index
		@categories = Category.paginate(page: params[:page], per_page: 3)
	end

	private
		def category_params
			params.require(:category).permit(:name)
		end

		def admin_require
			if !logged_in? || (logged_in? && !current_user.admin?)

			flash[:danger] = "Only admins can perform that action!"
			redirect_to categories_path
			end
		end
		def set_user
			@category = Category.find(params[:id])
		end

end