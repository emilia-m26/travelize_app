require './config/environment'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "pineapple_express"
    register Sinatra::Flash
    require 'sinatra/flash'
  end

  get "/" do
    erb :"goals/index"
  end

  get "/passport" do
    erb :"destinations/passport"
  end

  

end
