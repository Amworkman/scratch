class LabelController < ApplicationController

  get '/labels' do
    erb :'labels/show'
  end

end
