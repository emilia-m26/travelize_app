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
    erb :"travelers/login"
  end


  

end
