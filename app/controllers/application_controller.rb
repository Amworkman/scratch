class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, ENV["ms"]
    set :public_folder, 'public'
    set :views, './app/views'
    helpers Sinatra::Cookies
  end

  
  helpers do

    def signed_in? 
       !!session[:user_id]
    end

    def current_user
      @user ||= User.find(session[:user_id])
    end
  end
    
  get '/' do
    erb :'records/index'
  end
end
