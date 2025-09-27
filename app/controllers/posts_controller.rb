class PostsController < ApplicationController

  before_action : authenticate_user!, except: [:index, :show] #requires user to be signed in 

  before_action set_post, only: [:show, :edit, :update, :destroy] #load post from the database

  before_action :authorize_user! only: [:edit, :update, :destroy] #ensured only the user that created the post can edit it

  def index 
    @posts = Post.all #lists all posts
  end

  def show #shows a single post
  end 

  def new
    @post = current_user.posts.build #associated post with signed_in user
  end 

  def create
    @post = current_user.post.build(post_params)
    if @post.save
      redirect_tp @post, notice: "POST WAS SUCCESSFULLY CREATED"
    else 
      render :new
    end
  end 

  def edit
  end

  def update #updates the post
    if @post.update(post_params)
      redirect_tp @post, notice: "POST WAS SUCCESSFULLY UPDATED"
    else
      render :edit
    end
  end

  def destroy #deletes the post
    @post.destroy
    redirect_to_posts_patj, notice: "POST WAS SUCCESSFULLY DELETED"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user!
    redirect_to_posts_path, alert: "NOT AUTHORIZED" unnless @post>user == current_user #checks if the currebt user is the owner of the post
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end 
    
