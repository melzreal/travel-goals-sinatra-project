class HolidaysCountryController < ApplicationController



    get '/holidays/country/:id' do 

    	if logged_in? 
    		@country = Country.find(params[:id])
    		redirect "/holidays/country/#{@country.id}/edit"
		else 
			redirect "/login?error=You have to be logged in to do that"
		end 
	end 

    get '/holidays/country/:id/edit' do
    	
    	if logged_in?
    		@country = Country.find(params[:id])
			erb :'/holidays/edit_country'
		else 
			redirect "/login?error=You have to be logged in to do that"
		end 
	end 


	patch '/country/:id' do
		
        if logged_in?
          @country = Country.find(params[:id])
	          if !params[:country][:notes].empty?
		      	  @country.country_notes = params[:country][:notes]
		          @country.save
		          redirect to '/holidays'  
	          end
        else
         redirect "/login?error=You have to be logged in to do that"
        end
  	end





end 