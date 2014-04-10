class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.belongs_to :block
      t.text :content, :default => "(No content)"

      t.timestamps
    end
  end
end
