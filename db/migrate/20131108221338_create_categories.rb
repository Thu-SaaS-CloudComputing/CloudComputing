class CreateCategories < ActiveRecord::Migration
  def change
    drop_table :categories
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.text :option
      t.integer :parent, :default => 0

      t.timestamps
    end
  end
end
