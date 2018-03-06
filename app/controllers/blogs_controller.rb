class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  
  def index
   # @blogs=Blog.all
    #binding.pry
     @q = Blog.ransack(params[:q])
    @blogs = @q.result
  end
  
  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
  
  def create
   
    @blog = Blog.new(blog_params)
    if @blog.save
      # Switch to the list screen and display a message saying "You have created new blog!"
      redirect_to blogs_path, notice: "You have created new blog!"
    else
      # Redraw the input form.
      render 'new'
    end
  end
  
  def show
    @blog = Blog.find(params[:id])
  end
  
  def edit
     @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "You have edited this blog！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "You have deleted the blog!"
  end
  
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  # method to get the value by setting id as key
  def set_blog
      @blog = Blog.find(params[:id])
  end
end
