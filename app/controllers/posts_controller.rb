class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
    @teams = Team.all.order('created_at DESC')
    @events = Event.where("day >= ?", Date.today).order("created_at ASC")
  end

  def show
    @post = Post.find(params[:id])
    @posts= Post.order("created_at DESC")
  end

private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
