class PostsController < ApplicationController
  # Require users to be logged in for these actions
  before_action :authenticate_user!, except: [:index, :show]

  # Load the post for these actions
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # Ensure only the owner can edit and update or destroy
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  # List all posts
  def index
    @posts = Post.all
  end

  # Show a single post
  def show
  end

  # Form for new post
  def new
    @post = current_user.posts.build
  end

  # Create a post
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new
    end
  end

  # Form to edit post
  def edit
  end

  # Updates posts
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  # Deletes posts
  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully deleted."
  end

  private

  # Load post from database
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow the owner to edit and update or destroy
  def authorize_user!
    redirect_to posts_path, alert: "Not authorized" unless @post.user == current_user
  end


  def post_params
    params.require(:post).permit(:title, :body)
  end
end


