class SessionsController < ApplicationController
	
	def new
	end

	def create
		@user = User.find_by_email(params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			session[:id] = @user.id
			render :js => "window.location = '/users/show'"
		else
			if !@user
				render :json => { :error => "Invalid Email" }, :status => 422
			elsif @user && !@user.authenticate(params[:session][:password])
				render :json => { :error => "Invalid Password" }, :status => 422
			elsif params[:session][:email].blank? || params[:session][:password].blank?
				render :json => { :error => "Please fill in all fields" }, :status => 422
			end
		end
	end

	def destroy
		session.clear
		redirect_to root_path
	end

end