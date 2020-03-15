class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@post_images = PostImage.all
  	@post_comment = PostComment.new
  end
end
