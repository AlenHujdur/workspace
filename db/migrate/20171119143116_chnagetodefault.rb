class Chnagetodefault < ActiveRecord::Migration
  def change
    change_column :chefs, :picture, :string, :default => nil
  end
end
