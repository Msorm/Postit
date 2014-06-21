class UsersController < ApplicationController
	before_action :set_post, only: [:update, :show, :edit]
	before_action :require_same_user, only: [:update, :edit]
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "Your account has been successfully created"
			redirect_to root_path
		else
			render :new

		end
	end

	def edit
		
	end

	def update
		
	end

	def show
		
	end

	private

	def user_params
		params.require(:user).permit(:username, :password)
	end

	def set_post
		@user = User.find(params[:id])
	end

	def require_same_user
		if current_user != @user
			flash[:error] = "You don't have access"
			redirect_to root_path
		end

	end
end