class HolidaysController < ApplicationController

	get '/holidays' do


	  if logged_in?
	     @user = User.find_by_id(session[:user_id])
      	 erb :'holidays/holidays' 
	  else
	  	redirect '/login'
	  end  
	end

	get '/holidays/new' do 
	  if logged_in?
	    erb :'holidays/new_holiday' 
	  else
	  	redirect '/login'
	  end  
	end


	post '/holidays' do 
		
	 	if !params[:holiday].empty?
			@user = session[:user_id]
			@holiday = Holiday.create(params[:holiday])
			@holiday.user_id = @user
			@holiday.country_ids
			@holiday.save 
			redirect to "/holidays/#{@holiday.id}"
		else 
			redirect '/holidays'
		end 	
	end 

	get '/holidays/:id' do
	    if logged_in?
      		@holiday = Holiday.find(params[:id])
     		@user = User.find(@holiday.user_id)
     		@logged_in =  User.find_by_id(session[:user_id])
      		erb :'holidays/show_holiday'
    	else
      		redirect '/login'
    	end 
    end 



    get '/holidays/country/:id' do 
    	
    	if logged_in? 
    		@country = Country.find(params[:id])
    		redirect "/holidays/country/#{@country.id}/edit"
		else 
			redirect '/login'
		end 
	end 

    get '/holidays/country/:id/edit' do
    	
    	if logged_in?
    		@country = Country.find(params[:id])
			erb :'/holidays/edit_country'
		else 
			redirect '/login'
		end 
	end 



	delete '/holidays/country/:id/delete' do
	binding.pry
    	if logged_in?
    		@country = Country.find(params[:id])
    		user = User.find(session[:user_id])

       	CountryHoliday.all.each do |b|
       		if b.country_id == @country.id 
       			b.delete 
       		end 
       	end 
      #  	work in progress
      #unless Holiday.find(b.id) != session[:user_id]
	     # 	Holiday.all.map do |b| 
				  # b.country_ids.delete_if{ |c| c == country.id && b.user_id == session[:user_id] }
		   	# end  
   			redirect '/holidays'		 	 					
		else 
			redirect '/login'
		end 
	end 

	delete '/holidays/:id/delete' do
		
    	if logged_in?
    		 holiday = Holiday.find(params[:id])
    		 holiday.delete unless holiday.user_id != session[:user_id]
			 redirect '/holidays'
		else 
			redirect '/login'
		end 
	end 


end 