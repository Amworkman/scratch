class RecordContoller < ApplicationController
  
  get '/records' do
    @records = Record.all
    erb :'records/index'
  end

  get '/records/new' do
    erb :'records/new'
  end

  get '/records/:id' do
    @record = Record.find_by_id(params[:id])
    erb :'records/show'
  end

  get '/records/:id/edit' do
    @record = Record.find_by_id(params[:id])
    redirect "/records/#{record.id}"
  end

  post '/records' do

    #if lable does not exist
      #@label = Label.new(params[:label])
    #end


    #if artist does not exist
      #@artist = Artist.new(params[:artist])
    #endS

    # @record = Record.new(
    #   title: params[:title],
    #   barcode: params[:barcode],
    #   catalog_number: params[:catalog_number]
    #   artist_id: @artist.id
    #   label_id: @label.id
    # )

    # @user_records = user_records.new(
      # record_id: @record.id
      # user_id: user.id
    #)
    redirect "/records/#{record.id}"
  end

end
