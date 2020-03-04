class UsersController < ApplicationController

  def index
    @users = User.all
    #get all users and show their emails
  end

  def new
    @user = User.new 
  end

  def create

    @user = User.new(user_params)
    @user.save
    if !@user.valid?
      render "new"
      return
    end
    redirect_to user_path(@user)
    
    # TODO: create user
    #redirect to users path for that user 
  end

  def show 
    @user = User.find(params[:id])

    # TODO: show user email 
  end
private 

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
