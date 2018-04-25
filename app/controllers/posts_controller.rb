class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :DESC)
  end

  def new
  end

  def create
    @post = Post.new(content: params[:content])
    @post.create
    redirect_to posts_create_path
  end

  def show
     @post = Post.find_by(id: params[:id])
  end

  def edit
  end
end
