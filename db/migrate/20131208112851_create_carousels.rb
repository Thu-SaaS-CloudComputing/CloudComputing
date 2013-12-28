class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.text :title
      t.string :link
      t.string :picture
      t.integer :order

      t.timestamps
    end
  end
end
