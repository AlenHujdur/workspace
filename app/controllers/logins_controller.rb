class LoginsController < ApplicationController

  def new
   @disable_nav = true  
  end

  def create
   @disable_nav = true
   chef = Chef.find_by(email: params[:email])
   if chef && chef.check_password(params[:password])
      session[:chef_id] = chef.id
      flash[:success] = "You are logged in"   
      redirect_to recipes_path
    else
      flash.now[:danger] = "Your email adress or password does not match"
      render 'new'
    end
  end

  def destroy
    @disable_nav = true
    session[:chef_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end
