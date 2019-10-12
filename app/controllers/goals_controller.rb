class GoalsController < ApplicationController
  
    get "/goals" do
      erb :"goals/home"
    end

    get "/goals/new" do
        erb :"goals/create_goals"
    end

    post "/goals" do
        #will create new goal
        redirect "/goals"
    end

    get "/goals/:id" do
        erb :"goals/show"
    end

    get "/goals/:id/edit" do
        erb :"goals/edit_goals"
    end

    patch "/goals/:id" do
       #will pull info from edit_goals form and edit existing goal
    end

    delete "goals/:id" do
        #will delete goal
    end 

    
  
  
  end
  