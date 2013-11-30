class CreatePlugins < ActiveRecord::Migration
  def change
    create_table :plugins do |t|
      t.primary_key :id
      t.string :name
      t.text :description
      t.boolean :enable

      t.timestamps
    end
  end
end
