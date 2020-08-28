class RecordContoller < ApplicationController
  
  get '/records' do
    @records = Record.all
    erb :'records/index'
  end

  get '/records/new' do
    erb :'records/new'
  end

  get '/records/show/:id' do
    
    @user_record = UserRecord.where(user_id: current_user.id, record_id: params["id"]).first
    create_record
    erb :'records/show'
  end

  get '/records/:id' do
    @record = Record.find_by_id(params[:id])

    erb :'records/show'
  end

  get '/records/:id/edit' do
    @record = Record.find(params[:id])

    redirect "/records/#{record.id}"
  end

  get '/collection' do
    if signed_in?
      @collection = current_user.records.map {|record| record["lowest_price"].to_f} 
      @collection_value = @collection.inject(0, :+){|sum, x| sum + x }  
      erb :'records/collection'
    else
      redirect to :'sessions/new'
    end
  end

  post '/collection' do 
    if signed_in?      
     
      @user = User.find(session[:user_id])
      @record = Record.find(params[:record_id])
      @user.records << @record
      @collection = current_user.records.map {|record| record["lowest_price"].to_f} 
      @collection_value = @collection.inject(0, :+){|sum, x| sum + x }
      erb :'records/collection'
    else
      @error = "Please log in to add to your collection"
      redirect to '/sessions/new'
    end
  end

  post '/record' do
    update_record
    redirect to :"records/show/#{params['record_id']}"
  end

  post '/records' do
      discogs = DiscogsAPI.new
      @search_terms = params[:catalog_number]
      @catno_search = discogs.search_from_catalog_number(params[:catalog_number])

      erb :'records/find'    
  end

  patch '/record' do

    user_record = UserRecord.where(user_id: current_user.id, record_id: params["record_id"]).first
    user_record.purchase_price = params['purchase_price']
    user_record.save
    redirect to :"records/show/#{params['record_id']}"
    
  end
  
  delete '/record' do
    record = UserRecord.find_by(record_id: params["record_id"], user_id: params["user_id"])
    record.destroy
    redirect to :'/collection'
  end
end
