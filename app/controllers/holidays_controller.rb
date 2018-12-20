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


  	get '/holidays/user' do

    	if logged_in?
    		@user = User.find(session[:user_id])
    		erb :'holidays/show_user_holidays'
    	else
      		redirect '/login'
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

    get '/holidays/:id/edit' do

	    if logged_in?
      		@holiday = Holiday.find(params[:id])
     		@user = User.find(@holiday.user_id)
     		@logged_in =  User.find_by_id(session[:user_id])
      		erb :'holidays/edit_holiday'
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

	patch '/holidays/:id' do

        if logged_in?
          @holiday = Holiday.find(params[:id])
	          if !params[:holiday].empty?
	            @holiday.update(params[:holiday]) unless @holiday.user_id != session[:user_id]
	            @holiday.save
	            redirect to '/holidays'
	          else
	            redirect to '/holidays'
	          end
        else
         redirect '/login'
        end
  	end


	delete '/holidays/country/:id/delete' do
    	if logged_in?
    		@country = Country.find(params[:id])
    		user = User.find(session[:user_id])

       	CountryHoliday.all.each do |b|
       		if b.country_id == @country.id 
       			b.delete 
       		end 
       	end 
      
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