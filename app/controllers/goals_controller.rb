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
   
        if @goal
            erb :"goals/show"
        else
            redirect '/goals'
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
<<<<<<< HEAD

=======
>>>>>>> master-1
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
        if params[:title] == ""
            flash[:error_message] = "Oops! Goal not created. Please try again."
            redirect "/goals/new"
        else
            traveler = current_user
            @goal = Goal.create(:title => params[:title], :traveler_id => traveler.id)
            #@goal = Goal.new(params)
        # if @goal.save
        #     redirect "/goals"  #will need to see how to add destinations to the goals
        # else
        #     flash[:error] = "Oops! Goal not created. Please try again!"
        #     redirect "/goals/new"
            redirect "/goals"
        end
    end

    #delete action - deletes one goal based on id
    delete "/goals/:id" do
<<<<<<< HEAD
        goal = Goal.find_by(id:params[:id])
        if goal.destroy
            redirect "/goals"
        else
            redirect "/goals/#{goal.id}"
=======
        @goal = Goal.find_by(id:params[:id])
        if @goal.destroy
            redirect "/goals"
        else
            redirect "/goals/#{@goal.id}"
>>>>>>> master-1
        end 
    end

  end
  