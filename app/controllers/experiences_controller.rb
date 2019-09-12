class ExperiencesController < ApplicationController
  def index
    @experience_latest = Experience.all.order(created_at: :DESC).first 

    add_breadcrumb 'Experiences', :experiences_path
  end

  def show
    @experience = Experience.find(params[:id])
    debugger

    add_breadcrumb 'Experiences',                         :experiences_path
    add_breadcrumb @experience.experience_detail.title ,  :experience_path
  end

  def search 
  end 
  
  def application_form 
  end

  def send_request 
  end 
  
  def confirm 
  end

  def payment 
  end

  def complete 
  end
end
