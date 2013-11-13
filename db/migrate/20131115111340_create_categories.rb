class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.text :option
      t.integer :parent, :default => 0
      t.integer :order

      t.timestamps
    end
  end

  def down
    drop_table :categories
  end
end
