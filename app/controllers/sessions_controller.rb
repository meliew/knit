class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    #omniauth users
    if params[:provider]
      @user = User.find_by(
        email: params[:email],
        provider: params[:provider]
      )
      if !@user 
        @user = User.create!(
          email: params[:email],
          provider: params[:provider],
          password: SecureRandom.hex #generating random password since they will authenticate through OmniAuth
        )
      end
    else 
      #not omniauth 

      @user = User.find_by_email(params[:email])
      
      if !@user || !@user.authenticate(params[:password])
        flash[:error] = "We don't know you!"
        redirect_to root_path
        return
      end
    end
    session[:current_user_id] = @user.id
    redirect_to root_path
  end

  def new
    
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
