class CityHoliday < ActiveRecord::Base
  belongs_to :holiday
  belongs_to :city

end