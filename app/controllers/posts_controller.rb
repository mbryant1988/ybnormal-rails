class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
    @teams = Team.all.order('created_at DESC')
    @a = 1
  end

  def show
    @post = Post.find(params[:id])
    @posts= Post.order("created_at DESC").limit(4).offset(1)
  end

private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
