class HolidaysController < ApplicationController

	get '/holidays' do 
	  if logged_in?
	    erb :'holidays/holidays' 
	  else
	  	redirect '/login'
	  end  
	end



	post '/holidays' do 
		
	 	if !params[:holiday].empty?
			@user = session[:user_id]
			@holiday = Holiday.create(params[:holiday])
			@holiday.user_id = @user
			@holiday.save 
			redirect to "/holidays/#{@holiday.id}"
		else 
			redirect '/holidays'
		end 	
	end 

	get '/holidays/:id' do
	    if logged_in?

      		@holiday = Holiday.find(params[:id])
     		@user = User.find(session[:user_id])
     		@user_for_holiday = User.find(@holiday.user_id)
      		erb :'holidays/show_holiday'
    	else
      		redirect '/login'
    	end 
    end 

end 