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
    redirect "/login"
  end
  
  #for future functionality
  get "/passport" do
    erb :"destinations/passport"
  end

  #for future functionality
  get "/travelers" do
    erb :"travelers/travel_inspiration"
  end

  helpers do 
    def logged_in?
      !!session[:traveler_id]
    end

    def current_user
      Traveler.find_by_id(session[:traveler_id]) if logged_in?
    end
  end
  
end
