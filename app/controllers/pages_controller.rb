class PagesController < ApplicationController
#before_filter :disable_nav, only: [:welcome]

  def index
    @disable_nav = true
    @disable_footer = true
    @pages = Page.all
  end
  
  def welcome
    @disable_nav = true
    @disable_footer = true
    #render file: 'public/welcome'
    @pages = Page.all
  end
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(page_params)
    @page.save
    flash[:success] = 'Picture saved!'
    redirect_to recipes_path
  end
  
  # def welcome
  #   render file: 'public/welcome'
  # end

  def home
    @disable_nav = true
    @disable_footer = true
    redirect_to recipes_path if logged_in? 
  end
  
  
  private
  def page_params
    params.require(:page).permit(:welcomepic, :chef_id)
  end
end