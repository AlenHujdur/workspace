class IngredientsController < ApplicationController
 before_action :require_user, except: [:show]
 
 def show
   @ingredient = Ingredient.find(params[:id])
   @recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 3)
   @recipe = Recipe.find(params[:id])
 end
 
 def new
   @ingredient = Ingredient.new  
 end  
 
 def create
   @ingredient = Ingredient.new(ing_params)
   if @ingredient.save
     flash[:success] = "Great! you just created a new Ingredient."
     redirect_to recipes_path
   else
     render 'new' 
   end
 end
 
  def destroy
     @ingredient = Ingredient.find(params[:id]).destroy
     flash[:success] = "Ingredient removed!"
     redirect_to recipes_path
  end
 
 private
 
 def ing_params
   params.require(:ingredient).permit(:name)
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