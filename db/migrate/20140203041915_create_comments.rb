class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :article
      t.belongs_to :user
      t.text :content, :default => "(No content)"

      t.timestamps
    end
  end
end
