class BlogsController < ApplicationController
	 before_action :find_blog, only: [:edit, :show, :destroy, :update]
     def index
     	@b = Blog.all
     end
	 def new
		@b = Blog.new
	 end
	 def edit
	 end
     def show
     end
     def destroy
     	@b.destroy
     	flash[:danger] = "Blog was deleted"
     	redirect_to blogs_path
     end
	 def create
	     @b = Blog.new(blog_params)
          @b.user = User.find(3)
	     @b.save
	     if @b.save
	     	flash[:success] = 'Blog is successfully created'
	     	redirect_to blog_path(@b)
	     else
	     	render 'new'
	     end
	 end
     def update
     	if @b.update(blog_params)
     		flash[:success] = "Blog is successfully updated"
     		redirect_to blog_path(@b)
     	else 
     		render 'edit'
     	end
     end
     private
     def blog_params
     	params.require(:blog).permit(:apellation, :caption, :specification)
     end
     def find_blog
     	@b = Blog.find(params[:id])
     end
end