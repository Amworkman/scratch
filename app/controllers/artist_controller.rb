class ArtistController < ApplicationController

  get '/artists' do
    erb :'artists/show'
  end

end
