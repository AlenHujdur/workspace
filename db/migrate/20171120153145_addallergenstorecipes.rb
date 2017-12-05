class Addallergenstorecipes < ActiveRecord::Migration
  def change
    create_table :allergens do |t|
    t.string :name
  end
  end
end
