class HolidaysController < ApplicationController

	get '/holidays' do 
	    erb :'holidays/holidays' 
	end
end 