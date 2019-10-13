class GoalsController < ApplicationController
  
    #index action - displays all goals for one traveler
    get "/goals" do
        if logged_in?
            @traveler = current_user
    
            @goals = @traveler.goals
            #binding.pry
            erb :"goals/home"
        else
            redirect "/login"
        end
    end

    #new action - displays form to create new goal
    get "/goals/new" do
        erb :"goals/create_goals"
    end

    #create action - creates one goal
    post "/goals" do
        params[:complete] = params[:complete]? true : false
        @goal = Goal.create(params)
        if @goal.save
            redirect "/goals/#{@goal.id}"  #will need to see how to add destinations to the goals
        else
            redirect "/goals/new"
        end 
    end

    #show action - displays one goal based on ID
    get "/goals/:id" do
        @goal = Goal.find_by(id:params[:id])
       
        if @goal
            erb :"goals/display"
        else
            redirect '/goals'
        end
        erb :"goals/show"
    end

    #edit action - display edit form based on id
    get "/goals/:id/edit" do
        erb :"goals/edit_goals"
    end

    #update action - modify existing goal based on id
    patch "/goals/:id" do
       #will pull info from edit_goals form and edit existing goal
    end

    #delete action - deletes one goal based on id
    delete "goals/:id" do
        #will delete goal
    end 
      
  end
  