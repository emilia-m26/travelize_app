class GoalsController < ApplicationController
  
    #index action - displays all goals for one traveler
    get "/goals" do
        if logged_in?
            @traveler = current_user #has helper method
            @goals = @traveler.goals
            erb :"goals/index"
        else
            redirect "/login"
        end
    end

    #new action - displays form to create new goal
    get "/goals/new" do
        erb :"goals/new"
    end


    #show action - displays one goal based on ID
    get "/goals/:id" do
        @goal = Goal.find_by(id:params[:id])
   
        if @goal #&& @goal.traveler == current_user
            erb :"goals/show"
        else
            redirect '/login'
        end
    end

    #edit action - display edit form based on id
    get "/goals/:id/edit" do
        @goal = Goal.find_by(id:params[:id])
        #binding.pry
        erb :"goals/edit"
    end

    #update action - modify existing goal based on id
    patch "/goals/:id" do
        @goal = Goal.find_by(params[:id])
        #saving for future functionality of editing and completing an entire goal list
        #params[:goal][:complete] = params[:goal][:complete]? true : false
        if @goal.update(params[:goal]) #if successfully updated, redirect to goals
            redirect "/goals"
        else
            redirect "/goals/#{@goal.id}/edit" #if not successful, redirect to try again
        end
    end


    #create action - creates one goal
    post "/goals" do
        #saving for future functionality of completing an entire goal list
        #params[:complete] = params[:complete]? true : false
        @goal = Goal.new(params)
        if @goal.save
            redirect "/goals/#{@goal.id}"  #will need to see how to add destinations to the goals
        else
            flash[:error] = "Oops! Goal not created. Please try again!"
            #validates presence of info so that a blank goal cannot be created
            redirect "/goals/new"
        end 
    end

    #delete action - deletes one goal based on id
    delete "goals/:id" do
        @goal = Goal.find_by(id:params[:id])
        if @goal.destroy
            redirect "/goals"
        else
            redirect "/goals/#{@goal.id}"
        end 
    end 

  end
  