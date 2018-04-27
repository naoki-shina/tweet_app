class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email])
    if @user.save
      redirect_to users_index_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
