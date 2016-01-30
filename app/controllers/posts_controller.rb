class PostsController < ApplicationController
  def new
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to post_url(post)
    else
      flash[:post_error] = "Invalid parameters."
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  private
  def post_params
    params.require(:posts).permit(:title, :url, :content, :author_id, :sub_id)
  end
end
