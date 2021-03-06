class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :set_variable, only: [ :update, :edit, :show, :destroy ]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :DESC)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content], user_id: @current_user.id)
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to posts_index_path
    else
      render("/posts/new")
    end
  end

  def show
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end

  def edit
  end

  def update
    @post.content = params[:content]
    if @post.save
      redirect_to("/posts/index")
    else
      render("/posts/edit")
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_index_path
  end

  private
  def set_variable
    @post = Post.find_by(id: params[:id])
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to ("/posts/index")
    end
  end
end
