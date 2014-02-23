class PostsController < ApplicationController
  before_filter :find_post

  def index

  end

  private
  def find_post
    @post = Post.find(params[:id]) if params[:id]
  end
end
