# Only RegularUsers will be using this controller.
# Users going through OAuth accounts will be using
# the Sessions Controller

# Note that we're instantiating and working with
# RegularUser objects here, NOT User objects.
class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update]

  def new
    @user = RegularUser.new
  end

  def create
    @user = RegularUser.create params[:regular_user]
    if @user.save
      session[:user_id] = @user.id 
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = current_user
  end
end