class GoalsController < ApplicationController
  
   
    get "/goals" do
      erb :"goals/index"
    end
  
  
  end
  