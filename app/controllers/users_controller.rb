class UsersController < ApplicationController
  before_action :set_variables, only: [:edit, :update, :show]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], image_name: params[:image_name])
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to users_index_path
    else
      render ("users/new")
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.name = params[:name]
    @user.email = params[:email]
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}/edit")
    else
      render("/users/edit")
    end
  end

  private
  def set_variables
    @user = User.find_by(id: params[:id])
  end
end
