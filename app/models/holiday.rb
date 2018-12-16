class Holiday < ActiveRecord::Base
   belongs_to :user
   has_many   :country_holidays
   has_many   :countries, through: :country_holidays
   has_many   :cities, through: :countries
end