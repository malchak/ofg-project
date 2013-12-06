class UsersController < ApplicationController
	respond_to :json
	
	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			session[:id] = @user.id
			render :js => "window.location = '/users/show'"
		else
			errors = @user.errors.full_messages.join("<br>")
			render :json => { :error => errors }, :status => 422
		end
	end

	def show
		@user = current_user
		@user = User.find(@user.id)
	end

	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			render :js => "window.location = '/users/show'"
		else
			render :json => { :error => @user.errors.full_messages.join("<br/>") }, :status => 422
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :handicap)
	end

end