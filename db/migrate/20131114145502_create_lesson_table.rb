class CreateLessonTable < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? 'lessons'
      drop_table :lessons
    end
    create_table :lessons do |table|
      table.string :name
      table.integer :column
      table.integer :row
      table.string :classroom
      table.string :department
    end
  end
end
