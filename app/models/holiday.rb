class Holiday < ActiveRecord::Base
   belongs_to :user
   has_many   :country_holidays
   
   has_many   :countries, through: :country_holidays
   has_many   :cities, through: :country_holidays

   validates_presence_of :name
end