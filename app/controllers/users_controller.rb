class UsersController < ApplicationController

  def index
  	@users = User.all #params[:q] ? User.search_for(params[:q]) : User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(safe_user_params)
    if @user.save
      redirect_to @user
    else
      render 'update'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(safe_user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  end

 

  private

  def safe_user_params
    params.require('user').permit(:name, :group, :group_id)
  end

  def load_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash.now[:notice] = "Invalid User ID #{params[:id]}"
    redirect_to root_path
  end
end
