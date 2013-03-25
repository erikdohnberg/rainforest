class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			# flash[:notice] # Everthing is ok
			# flash[:alert] # Something happened. The user should know. Not quite and error
			# flash[:error] # Something went wrong.
			flash[:notice] = "Signup was successful!"
			redirect_to products_path
		else
			# renders the view for the new user! Instead of "action" consider it "view"
			render :action => :new
		end
	end
end
