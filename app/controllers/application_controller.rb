class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :set_experience_search_variables

  add_breadcrumb 'Top', :top_path

  protected
    def set_experience_search_variables
      @locations               = Location.all 
      @categories              = Category.all 
      @experience_search       = Experience.ransack(params[:q])
      @experience_search.sorts = 'title desc' if @experience_search.sorts.empty?
    end
end
