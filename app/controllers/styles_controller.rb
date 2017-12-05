class StylesController < ApplicationController
 before_action :require_user, except: [:show]
 
 def show
   @style = Style.find(params[:id])
   @recipes = @style.recipes.paginate(page: params[:page], per_page: 3)
   @recipe = Recipe.find(params[:id])
 end
 def new
   @style = Style.new
 end
  
  def create
    @style = Style.new(style_params)
    if @style.save
      flash[:success] = "Congratulation you just creates a New Style."
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  
  def destroy
     @style = Style.find(params[:id]).destroy
     flash[:success] = "Style removed!"
     redirect_to recipes_path
  end
  
  private
  
  def style_params
     params.require(:style).permit(:name)
  end
  
  def require_same_user
    if current_user != @recipe.chef and !current_user.admin?
     flash[:danger] = "You can only edit your own recipes"
     redirect_to recipes_path
    end
  end
  
  def admin_user
     redirect_to recipes_path unless current_user.admin?
  end
  
end