class ChefsController < ApplicationController
  before_action :set_chef, only: [:edit, :update, :show, :destroy
  ]
  before_action :require_same_user, only:[:edit, :update, :destroy
  ]

 def index
   @chefs = Chef.paginate(page: params[:page], per_page: 3)
 end
 
  def new
    @chef = Chef.new
    @changed = false
  end
  
  def new_guest
    @chef = Chef.new
    @changed = false
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "Your account has been created succesfully"
      session[:chef_id] = @chef.id
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  
  def edit
     @changed = false
  end 
  
  def update
    if @chef.update(chef_params)
      flash[:success] = "Your profile has been updated succesfully"
      redirect_to chef_path(@chef)
    else
      render 'edit'
    end
  end
  
 def show
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 3)
 end
 
# def destroy
#   @recipe = Recipe.find(params[:id])
#   @recipe.destroy
#   flash[:success] = "Recipe removed!"
#   redirect_to chefs_path
# end
 
 private
  
  def chef_params
    params.require(:chef).permit(:chefname, :email, :password, :picture, :admin)
  end
  
  def recipe_params
    params.require(:recipe).permit(:name, :summary, :description, :picture, :style_id, :ingredient_id)
  end
  
  def set_chef
   @chef = Chef.find(params[:id])
  end  
  def require_same_user
    if current_user != @chef
      flash[:danger] = "You can only edit your own profile"
      redirect_to root_path
    end 
  end
end