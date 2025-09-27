class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show] #to make sure that new,create,edit,update and destroy only work witha signed in user

end
