class UsersController < ApplicationController

  def index
    user_database = User.all
    @list_of_users = user_database.order({:id => :asc})

    current_user_id = session.fetch(:user_id)
    current_user = User.where(:id => current_user_id)
    @current_user = current_user.at(0)

    render({:template => "users/index"})
  end

  def show
    selected_username = params.fetch("path_id")
    matching_user = User.where({:username => selected_username})
    @selected_user = matching_user.at(0)


    current_user_id = session.fetch(:user_id)
    current_user = User.where(:id => current_user_id)
    @current_user = current_user.at(0)


    @accepted_requests = @selected_user.followers.where(:status => "accepted")

    if session.fetch(:user_id) == nil
      redirect_to("/user_sign_in", {:notice => "You have to sign in first."})
    else
      render({:template => "users/show"})
    end
    
  end

  def feed
    selected_username = params.fetch("path_id")
    matching_user = User.where({:username => selected_username})
    @selected_user = matching_user.at(0)

    current_user_id = session.fetch(:user_id)
    current_user = User.where(:id => current_user_id)
    @current_user = current_user.at(0)

    @accepted_requests = @selected_user.followers.where(:status => "accepted")
   
    render({:template => "users/feed"})
  end
  
end