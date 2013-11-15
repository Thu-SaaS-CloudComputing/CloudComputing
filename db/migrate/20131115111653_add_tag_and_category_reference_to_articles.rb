class AddTagAndCategoryReferenceToArticles < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.references :category
      t.text :tags
    end
  end
end
