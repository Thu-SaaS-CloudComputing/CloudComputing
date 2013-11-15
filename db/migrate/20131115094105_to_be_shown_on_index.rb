class ToBeShownOnIndex < ActiveRecord::Migration
  def change
    add_column :categories, :show_on_index, :string
  end
end
