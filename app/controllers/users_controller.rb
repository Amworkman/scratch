class UsersController < ApplicationController

  get "/users/new" do
    erb  :"/users/new"
  end

  post "/users" do
    if User.all.detect {|user| user["username"] == params["username"]}
      @error = "This username already exists. Please pick another username."
      erb :"/users/new"
    elsif @user = User.create(params)      
      session[:user_id] = @user.id
      redirect "/records/new"
    else
      @error = "Invalid input. Please try again."
      erb :"/users/new"
    end
  end
end