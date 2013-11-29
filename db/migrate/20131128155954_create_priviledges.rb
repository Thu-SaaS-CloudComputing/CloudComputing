class CreatePriviledges < ActiveRecord::Migration
  def change
    create_table :priviledges do |t|
      t.string :name, unique: true
      t.string :description

      t.timestamps
    end

    create_table :priviledges_users do |t|
      t.belongs_to :priviledge
      t.belongs_to :user
    end
  end
end
