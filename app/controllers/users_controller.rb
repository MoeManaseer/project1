class UsersController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      if user
        flash.now[:error] = "Incorrect password."
      else
        flash.now[:error] = "You are not registerd."
      end
      render 'new'
    end
  end

  def destroy
    session[:user_id]= nil;
    redirect_to login_path
  end
end
