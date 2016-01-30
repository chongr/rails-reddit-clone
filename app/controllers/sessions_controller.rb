class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(params[:users][:name], params[:users][:password])
    if user
      login!(user)
      redirect_to user_url(user)
    else
      render :new
    end
  end

  def destroy
    logout!(current_user)
    session[:session_token] = nil
    render :new
  end
end
