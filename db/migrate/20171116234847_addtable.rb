class Addtable < ActiveRecord::Migration
  def change
    create_table :pages do |p|
      p.string :welcomepic
      p.integer :chef_id, default: 0
    end
  end
end
