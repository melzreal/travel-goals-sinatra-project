class CountryHoliday < ActiveRecord::Base
  belongs_to :holiday
  belongs_to :country
  belongs_to :city
end