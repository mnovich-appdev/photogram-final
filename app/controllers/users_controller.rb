class UsersController < ApplicationController

  # INDEX PAGE

  def index
    user_database = User.all
    @list_of_users = user_database.order({:id => :asc})

    render({:template => "users/index"})
  end

end