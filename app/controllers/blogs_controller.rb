class BlogsController < ApplicationController
	 
     def index
     	@blogs = Blog.all
     end
	 def new
		@b = Blog.new
	 end
	  def edit
	 	@b = Blog.find(params[:id])
	 end
     def show
     	@b = Blog.find(params[:id])
     end
	 def create
	     @b = Blog.new(blog_params)
	     @b.save
	     if @b.save
	     	flash[:notice] = 'Blog is successfully created'
	     	redirect_to blog_path(@b)
	     else
	     	render 'new'
	     end
	 end
     def update
     	@b = Blog.find(params[:id])
     	if @b.update(blog_params)
     		flash[:notice] = "Blog is successfully updated"
     		redirect_to blog_path(@b)
     	else 
     		render 'edit'
     	end
     end
     private
     def blog_params
     	params.require(:blog).permit(:apellation, :caption, :specification)
     end

end