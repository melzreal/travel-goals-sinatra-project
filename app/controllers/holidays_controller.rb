class HolidaysController < ApplicationController

	get '/holidays' do
	  if logged_in?
	     @user = User.find_by_id(session[:user_id])
      	 erb :'holidays/holidays' 
	  else
	  	redirect "/login?error=You have to be logged in to do that"
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

			@holiday = Holiday.new(name: params[:holiday][:name], country_ids: params[:holiday][:country_ids])
			@holiday.user_id = @user
			
				if params[:city][:name] != ["", "", ""]
					cities = []
					params[:city][:name].each do |a| 
							@city = City.find_or_create_by(name: a) unless a == ""
							cities << @city.id 
							@holiday.city_ids = cities
							@holiday.save 
							redirect to "/holidays/#{@holiday.id}"
					end
				else
					@holiday.save 
					redirect to "/holidays/#{@holiday.id}"
				end 
		
			
		else 
			redirect '/holidays'
		end 	
	end 


  	get '/holidays/user' do
  	 
    	if logged_in?
    		@user = User.find(session[:user_id])
    		@countries = @user.countries.uniq
    		@cities = @user.cities.uniq
    		
    		erb :'holidays/show_user_holidays'
    	else
      		redirect "/login?error=You have to be logged in to do that"
    	end  
    end 

	get '/holidays/:id' do
		
	    if logged_in?
      		@holiday = Holiday.find(params[:id])
     		@user = User.find(@holiday.user_id)
     		@logged_in =  User.find_by_id(session[:user_id])
      		erb :'holidays/show_holiday'
    	else
      		redirect "/login?error=You have to be logged in to do that"
    	end 
    end 

    get '/holidays/:id/edit' do
    	
	    if logged_in?
      		@holiday = Holiday.find(params[:id])
     		@user = User.find(@holiday.user_id)
     		@logged_in =  User.find_by_id(session[:user_id])
      		erb :'holidays/edit_holiday'
    	else
      		redirect "/login?error=You have to be logged in to do that"
    	end 
    end 


	patch '/holidays/:id' do

        if logged_in?
          @holiday = Holiday.find(params[:id])
	          if !params[:holiday].empty?
	            @holiday.update(params[:holiday]) unless @holiday.user_id != session[:user_id]
	            @holiday.save
	            unless params[:city][:name].empty?
      				@holiday.cities << City.create(params[:city])
    			end
	            redirect to '/holidays'
	          else
	            redirect to '/holidays'
	          end
        else
         redirect "/login?error=You have to be logged in to do that"
        end
  	end



	delete '/holidays/:id/delete' do
		
    	if logged_in?
    		 holiday = Holiday.find(params[:id])
    		 holiday.delete unless holiday.user_id != session[:user_id]
			 redirect '/holidays'
		else 
			redirect "/login?error=You have to be logged in to do that"
		end 
	end 


end 