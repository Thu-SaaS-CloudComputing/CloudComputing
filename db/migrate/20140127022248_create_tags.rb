class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, unique: true

      t.timestamps
    end

    create_table :articles_tags, id: false do |t|
      t.belongs_to :tag
      t.belongs_to :article
    end
  end
end
