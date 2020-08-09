class SessionController < ApplicationController
  
  get '/sessions/new' do
     erb :'sessions/new'
   end

  
  post '/sessions' do
  
     @user = User.find_by(username: params[:username])

       if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
         redirect to '/collection'
       else
         @error = "Incorrect username or password"
         erb :'sessions/new'
       end
   end

  
   delete '/sessions' do 
     session.clear
     redirect to '/sessions/new'
   end

end