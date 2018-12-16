class UsersController < ApplicationController

	get '/signup' do
		erb :signup
	end

	post '/signup' do
	  user = User.new(:username => params[:username], :password => params[:password])
		if user.save
			redirect '/login'
		else
			redirect '/error'
		end
	end


	post '/login' do
	  user = User.find_by(:username => params[:username])	 
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect '/holidays'
		else
			redirect '/error'
		end

	end

	get '/success' do
		if logged_in?
		  erb :success
		else
		  redirect '/login'
		end 
	end

	get '/error' do
		erb :'/users/error'
	end

	get '/logout' do
		if is_logged_in?(session)
	      session.clear
	      redirect '/login'
	    else
    	  redirect '/'
  	  	end
	end

end 