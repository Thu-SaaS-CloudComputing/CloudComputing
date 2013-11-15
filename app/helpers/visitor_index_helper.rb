module VisitorIndexHelper
  def generate_lesson_table(row, col, table_data)
    str = Array.new
    if table_data.has_key?(row)
      row_data = table_data[row]
      if row_data.has_key?(col)
        row_data[col].each do |lesson|
          str << "#{lesson.name}"
          str << "At #{lesson.classroom}"
        end
      end
    end
    return str
  end
end
