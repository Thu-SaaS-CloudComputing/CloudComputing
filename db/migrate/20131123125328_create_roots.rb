class CreateRoots < ActiveRecord::Migration
  def change
    create_table :roots do |t|
      t.string :username, unique: true
      t.string :password
      
      t.timestamps
    end
  end
end
