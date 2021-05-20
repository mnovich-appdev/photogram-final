class UsersController < ApplicationController

  # INDEX PAGE

  def index
    render({:template => "users/index"})
  end

end