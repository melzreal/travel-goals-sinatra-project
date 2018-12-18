class UsersController < ApplicationController

	get '/signup' do
	 session.clear
	 
	 if logged_in?
		redirect '/holidays'
	 else
		erb :'users/signup'
	 end
	end

	post '/signup' do
	 if params[:user][:username].empty? || params[:user][:email].empty? || params[:user][:password].empty?
      redirect '/error'
     else
       @user = User.create(params[:user])
       @user.save
       session[:user_id] = @user.id
       redirect '/holidays'
     end
	end
 
    
    get '/login' do
      if logged_in?
        redirect '/holidays'
      else
        erb :'/users/login'
      end
    end


	post '/login' do
		
	  user = User.find_by(:username => params[:user][:username])	 
		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id
			redirect '/holidays'
		else
			redirect '/error'
		end

	end
	

	get '/error' do
		erb :'/users/error'
	end

	get '/logout' do
		if logged_in?
	      session.clear
	      redirect '/login'
	    else
    	  redirect '/'
  	  	end
	end

end 