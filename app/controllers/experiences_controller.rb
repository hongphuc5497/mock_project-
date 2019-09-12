require 'gon'
require 'date'

class ExperiencesController < ApplicationController
  def index
    @experience_latest       = Experience.all.order(created_at: :DESC).first 
    @experience_search       = Experience.ransack(params[:q])
    @experience_search.sorts = 'title desc' if @experience_search.sorts.empty? 
    @experiences             = @experience_search.result(distinct: true).order(created_at: :DESC).page(params[:page]).per(3) 
    @page                    = params[:page].to_i
    respond_to do |format| 
      format.html
      format.json { render json: @experiences }
    end

    add_breadcrumb 'Experiences', :experiences_path
  end

  def show
    current_experience
    @recommend_experiences = Experience.where(["location_id = ?", @experience.location_id]).first(4)
    @host                  = Host.find_by_id(@experience.host_id)
    load_available_dates

    add_breadcrumb 'Experiences',                         :experiences_path
    add_breadcrumb @experience.experience_detail.title ,  :experience_path
  end

  def search 
    index 
    render :index
  end 

  def application_form 
    current_experience_price
    @dates = @experience.available_dates_to_book
  end

  def confirm 
    current_experience_price
  end

  def send_request 
    current_experience
    #send params to booking
  end 

  def payment 
    current_experience_price
  end

  def complete 
    current_experience_price
    @recommend_experiences = Experience.where(["location_id = ?", @experience.location_id]).first(4)
    #booking 
  end

  private
    def current_experience
      @experience = Experience.find(params[:id])
      gon.experience_id = @experience.id
    end

    def current_experience_price
      current_experience 
      gon.price_adult   = @experience.experience_detail.price_adult 
      gon.price_chilren = @experience.experience_detail.price_children
      gon.price_infant  = @experience.experience_detail.price_infant
    end 

    def load_available_dates
      @experience       = Experience.find(params[:id])
      @experience_dates = @experience.experience_detail
      @available_dates  = []

      @experience_dates.each do |date|
        (Date.parse(date.date_from.to_s)..Date.parse(date.from_to.to_s)).each do |object|
          @available_dates.push(object.to_date.month, object.to_date.day)
        end 
      end
      Gon.global.available_dates = @available_dates
    end
end
