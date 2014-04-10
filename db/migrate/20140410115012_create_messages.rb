class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :type
      t.string :content
      t.string :uri
      t.belongs_to :user

      t.timestamps
    end
  end
end
