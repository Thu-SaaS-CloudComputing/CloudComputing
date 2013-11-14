class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.references :category
      t.text :content, :default => "(No Content)"

      t.timestamps
    end
    add_index :articles, :category_id
  end
end
