class AllergensController < ApplicationController
 before_action :require_user, except: [:show]
 
 def show
   @allergen = Allergen.find(params[:id])
   @recipes = @allergen.recipes.paginate(page: params[:page], per_page: 3)
   @recipe = Recipe.find(params[:id])
 end
 def new
   @allergen = Allergen.new
 end
  
  def create
    @allergen = Allergen.new(allergen_params)
    if @allergen.save
      flash[:success] = "Congratulation you just creates a New Allergen."
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  
  def destroy
     @allergen = Allergen.find(params[:id]).destroy
     flash[:success] = "Alleregen removed!"
     redirect_to recipes_path
  end
  
  private
  
  def allergen_params
     params.require(:allergen).permit(:name)
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