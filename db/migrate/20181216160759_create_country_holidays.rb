class CreateCountryHolidays < ActiveRecord::Migration[5.2]
  def change
	create_table :country_holidays do |t|
   	  t.integer  :holiday_id
   	  t.integer  :country_id
   	end
  end
end
