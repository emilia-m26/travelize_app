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

  # get "/" do
  #   erb :layout
  # end

  # get "/" do
  #   erb :"travelers/login"
  # end

  # get "/signup" do
  #   erb :"travelers/create_account"
  # end

  get "/" do
    redirect "/login"
  end
  
  get "/passport" do
    erb :"destinations/passport"
  end

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
