class Addrecipeallergens < ActiveRecord::Migration
  def change
    create_table :recipe_allergens do |t|
      t.integer :allergen_id, :recipe_id
    end
  end
end
