class SubsController < ApplicationController
  before_action :check_owner, only: [:edit, :update]

  def new
  end

  def show
    @sub = Sub.find_by(id: params[:id])
  end

  def index
    @subs = Sub.all
  end

  def create
    new_sub = Sub.new(sub_params)
    if new_sub.save
      redirect_to sub_url(new_sub)
    else
      redirect_to subs_url
    end
  end

  def update
    cur_sub = Sub.find_by(id: params[:id])
    if cur_sub.update(sub_params)
      redirect_to sub_url(cur_sub)
    else
      flash[:errors] = "Invalid input"
      redirect_to edit_sub_url(cur_sub)
    end

  end

  def edit
    @sub = Sub.find_by(id: params[:id])
  end

  def check_owner
    if !logged_in?
      redirect_to new_sessions_url
      flash[:not_logged] = "Please Login"
    elsif current_user != Sub.find_by(id: params[:id]).moderator
      flash[:not_user] = "You are not authorized to view that"
      redirect_to user_url(current_user)
    end
  end


  private

  def sub_params
    params.require(:subs).permit(:title, :description, :moderator_id)
  end
end
