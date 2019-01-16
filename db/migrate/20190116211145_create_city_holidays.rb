class CreateCityHolidays < ActiveRecord::Migration[5.2]
  def change
  	create_table :city_holidays do |t|
  	  t.integer  :holiday_id
   	  t.integer  :city_id
   	 end
  end
end
