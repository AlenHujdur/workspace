class AddDrinkPicToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :drinkpic, :string
  end
end
