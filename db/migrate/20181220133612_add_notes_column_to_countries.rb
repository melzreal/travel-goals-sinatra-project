class AddNotesColumnToCountries < ActiveRecord::Migration[5.2]
  def change
  	add_column :countries, :country_notes, :string
  end
end
