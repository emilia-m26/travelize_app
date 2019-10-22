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
   
        if @goal && @goal.traveler == current_user
            erb :"goals/show"
        else
            redirect '/login'
        end
    end

    #edit action - display edit form based on id
    get "/goals/:id/edit" do
        @goal = Goal.find_by(id:params[:id])
        erb :"goals/edit"
    end

    #update action - modify existing goal based on id
    patch "/goals/:id" do
        @goal = Goal.find_by(id:params[:id])
        #saving for future functionality of editing and completing an entire goal list
        #params[:goal][:complete] = params[:goal][:complete]? true : false
        if @goal.update(params[:goal])
            redirect "/goals"
        else
            redirect "/goals/#{@goal.id}/edit"
        end
    end

    #create action - creates one goal
    post "/goals" do
        #saving for future functionality of completing an entire goal list
        #params[:complete] = params[:complete]? true : false
        @goal = current_user.goals.build(params)
        if @goal.save
            redirect "/goals"
        else
            #traveler = current_user
            #@goal = Goal.create(:title => params[:title], :traveler_id => traveler.id)
            flash[:error] = "Oops! Goal not created. Please try again."
            redirect "/goals/new"   
        end
    end

    #delete action - deletes one goal based on id
    delete "/goals/:id" do
        @goal = Goal.find_by(id:params[:id])
        if @goal.destroy
            redirect "/goals"
        else
            redirect "/goals/#{@goal.id}"
        end 
    end

  end
  