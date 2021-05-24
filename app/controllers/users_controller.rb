class UsersController < ApplicationController

  # INDEX PAGE

  def index
    user_database = User.all
    @list_of_users = user_database.order({:id => :asc})

    render({:template => "users/index"})
  end

  def show
    selected_username = params.fetch("path_id")
    matching_user = User.where({:username => selected_username})
    @selected_user = matching_user.at(0)

    if session.fetch(:user_id) == nil
      redirect_to("/user_sign_in", {:notice => "You have to sign in first."})
    else
      render({:template => "users/show"})
    end
    
  end

end