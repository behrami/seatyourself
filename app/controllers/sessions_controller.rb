class SessionsController < ApplicationController

  def new

  end

  def create

        user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to restaurants_path, notice: "Logged in!"
    else
      render :new
    end


  end

  def destroy

    session[:user_id] = nil

    redirect_to root_path, alert: "Logged out!"

  end

end
