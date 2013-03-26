class SessionsController < ApplicationController
	
	# Give us the login form
	def new
	end

	# Start a session
	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
    	redirect_to products_path, :notice => "Logged in!"
  else
    flash.now[:alert] = "Invalid email or password" 
  end
	end

	# End a session
	def destroy
	end

end
