class SessionsController < ApplicationController
	def new
	end 
	def create
	  user = User.find_by(email: params[:email])

	  if user && user.authenticate(params[:password])
	    log_in user
	    params[:remember_me] == '1' ? remember(user) : forget(user)

	    flash[:notice] = "Successfully logged"
	    redirect_to root_path

	  else
	    flash.now[:danger] = 'Invalid email/password combination'
	    render 'new'
	  end
	end

	def destroy
		log_out if logged_in?
		flash[:notice] = "Successfully disconnected"
		redirect_to root_path
	end 
end
