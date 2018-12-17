class HolidaysController < ApplicationController

	get '/holidays' do 
	  if logged_in?
	    erb :'holidays/holidays' 
	  else
	  	redirect '/login'
	  end  
	end

	post '/holidays' do 
		binding.pry
	 	if !params[:holiday].empty?
			@user = session[:user_id]
			@holiday = Holiday.create(params[:holiday])
			@holiday.user_id = @user
			@holiday.save 
			redirect to "/holiday/#{@holiday.id}"
		else 
			redirect '/holidays'
		end 	
	end 

	get '/holiday/:id' do
		erb :'holidays/show_holiday'
	end 


end 