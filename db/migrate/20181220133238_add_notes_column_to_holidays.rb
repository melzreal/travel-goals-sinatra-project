class AddNotesColumnToHolidays < ActiveRecord::Migration[5.2]
  def change
  	add_column :holidays, :holiday_notes, :string
  end
end
