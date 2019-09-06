class BlogController < ApplicationController
  impressionist 

  def index
    add_breadcrumb 'Blog', :blog_index_path 

    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])

    add_breadcrumb 'Blog',                  :blog_show_path
    add_breadcrumb @blog.blog_detail.title, :blog_path 
  end
end
