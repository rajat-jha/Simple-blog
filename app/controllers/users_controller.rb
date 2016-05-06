class UsersController < ApplicationController
	def new 
		@u = User.new
	end
    def create 
    	@u = User.new(user_params)
        if @u.save
	    	flash[:success] = "Welcome to Alpha Blog #{@u.username}"
	        redirect_to blogs_path
	    else 
	    	render 'new'
	    end
	end
	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end
