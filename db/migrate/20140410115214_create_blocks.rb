class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :name
      t.text :description
      t.text :option
      t.integer :parent, :default => 0
      t.integer :order

      t.timestamps
    end
  end
end
