class SessionsController < ApplicationController
	
	# Give us the login form
	def new
	end

	# Start a session
	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
    	redirect_to products_path, :notice => "You are logged in!"
	  else
	    flash.now[:alert] = "Invalid email or password"
	    render :new
	  end
	end

	# End a session
	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end

end
