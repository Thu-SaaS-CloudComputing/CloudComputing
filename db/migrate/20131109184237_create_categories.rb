class CreateCategories < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? 'categories'
      drop_table :categories
    end
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.text :option
      t.integer :parent, :default => 0
      t.integer :order

      t.timestamps
    end
  end
end
