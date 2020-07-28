class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/records' do
    @records = Record.all
    erb :index
  end

  get '/records/new' do
    erb :new
  end

  get '/records/:id' do
    @record = Record.find_by_id(params[:id])
    erb :show
  end

  get '/:artist/records' do
    @records = Record.all.sellect {|record| record.artist == (params[:artist])}
  end

  get '/:label/records' do
    @records = Record.all.sellect {|record| record.artist == (params[:label])}
  end

  get '/records/:name' do
    @record = Record.find(params[:name])
    erb :show
  end


end
