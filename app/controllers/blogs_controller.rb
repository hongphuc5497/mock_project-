class BlogsController < ApplicationController
  impressionist 

  def index
    @blogs      = Blog.all.order(created_at: :DESC).page(params[:page]).per(3)
    @blog_first = Blog.all.order(created_at: :DESC).first 
    @blog_count = Blog.count
    @page       = params[:pagenum].to_i

    @blog_impression_1 = Blog.all.order(impressions_count: :DESC).first  
    @blog_impression_2 = Blog.all.order(impressions_count: :DESC).second
    @blog_impression_3 = Blog.all.order(impressions_count: :DESC).third

    @categories = Category.all
    @locations  = Location.all
    
    @search       = .ransack(params[:q])
    @search.sorts = 'blog_details.title desc' if @search.sorts.empty?
    @blogs        = @search.result(distinct: true).order(created_at: :DESC).page(params[:page]).per(3)

    respond_to do |format| 
      format.html
      format.json { render json: @blogs }
    end 

    add_breadcrumb 'Blogs', :blogs_path
  end

  def show
    @blog  = Blog.find(params[:id])

    @blog_impression_1 = Blog.all.order(impressions_count: :DESC).first  
    @blog_impression_2 = Blog.all.order(impressions_count: :DESC).second
    @blog_impression_3 = Blog.all.order(impressions_count: :DESC).third

    add_breadcrumb 'Blog',                   :blogs_path
    add_breadcrumb @blog.blog_detail.title,  :blog_path
  end
end
