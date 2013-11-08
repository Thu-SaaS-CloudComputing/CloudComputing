class CreateArticles < ActiveRecord::Migration
  def change
    drop_table :articles
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.references :category
      t.string :content, :default => "(No Content)"

      t.timestamps
    end
    add_index :articles, :category_id
  end
end
