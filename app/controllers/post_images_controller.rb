class PostImagesController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def index
    @post_images = PostImage.all
    @user = current_user
  end

  def show
    @post_images = PostImage.find(params[:id])
  end

  def new
    @post_image = PostImage.new
  end

  def edit
    post_images = PostImage.find(params[:id])
  end

  def update
    post_images = PostImage.find(params[:id])
    post_image.update(post_image_params)
    redirect_to post_images_path
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @book.save
      flash[:create] = "You have posted a photo successfully."
      redirect_to post_image_path(@book)
    else
      @post_image = PostImage.all
      @user = current_user
      render 'index'
    end
  end

  def destroy
    post_images = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_image_path
  end

  private
    def post_image_params
      params.require(:post_image).permit(:image_id, :caption, :location, :user_id)
    end
    def correct_user
    @book = Book.find(params[:id])
    if current_user != @post_image.user
      redirect_to post_images_path
    end
  end
end
