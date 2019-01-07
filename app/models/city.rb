class City < ActiveRecord::Base
   has_many   :country_holidays
   has_many   :holidays, through: :country_holidays
   validates_uniqueness_of :name
end