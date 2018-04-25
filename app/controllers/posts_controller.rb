class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def show
     @post = Post.find_by(id: params[:id])
  end
end
