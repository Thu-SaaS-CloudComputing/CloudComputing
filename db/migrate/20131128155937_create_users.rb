class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, unique: true
      t.string :studentID

      t.timestamps
    end
  end
end
