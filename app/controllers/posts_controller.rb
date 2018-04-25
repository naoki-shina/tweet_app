class PostsController < ApplicationController
  before_action :set_variable, only: [ :update, :edit, :show, :destroy ]

  def index
    @posts = Post.all.order(created_at: :DESC)
  end

  def new
  end

  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to posts_index_path
  end

  def show
  end

  def edit
  end

  def update
    @post.content = params[:content]
    @post.save
    redirect_to("/posts/index")
  end

  def destroy
    @post.destroy
    redirect_to posts_index_path
  end

  private
  def set_variable
    @post = Post.find_by(id: params[:id])
  end
end
