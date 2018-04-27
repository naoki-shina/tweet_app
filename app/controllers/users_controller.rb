class UsersController < ApplicationController
  before_action :set_variable, only: [:show, :edit]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email])
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

  private
  def set_valiable
    @user = User.find_by(id: params[:id])
  end
end
