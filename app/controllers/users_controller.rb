class UsersController < ApplicationController
  before_action :check_user, only: :show

  def new

  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to user_url(user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def check_user
    if !logged_in?
      redirect_to new_sessions_url
      flash[:not_logged] = "Please Login"
    elsif current_user.id.to_s != params[:id]
      flash[:not_user] = "You are not authorized to view that"
      redirect_to user_url(current_user)
    end
  end

  private
  def user_params
    params.require(:users).permit(:name, :password)
  end
end
