class Country < ActiveRecord::Base
   has_many   :cities
   has_many   :country_holidays
   has_many   :holidays, through: :country_holidays
   has_many   :cities, through: :country_holidays

   validates_presence_of :name
end