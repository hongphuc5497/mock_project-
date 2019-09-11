class ExperiencesController < ApplicationController
  def index
    
    add_breadcrumb 'Experiences', :experiences_path
  end

  def show
    @experience = Experience.find(params[:id])
    debugger

    add_breadcrumb 'Experiences',                         :experiences_path
    add_breadcrumb @experience.experience_detail.title ,  :experience_path
  end
end
