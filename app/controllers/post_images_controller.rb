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

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      flash[:create] = "You have posted a photo successfully."
      redirect_to post_images_path(@book)
    else
      @post_images = PostImage.all
      @user = current_user
      render 'new'
    end
  end

  def edit
    post_images = PostImage.find(params[:id])
  end

  def update
    post_images = PostImage.find(params[:id])
    post_image.update(post_image_params)
    redirect_to post_images_path
  end

  def destroy
    post_images = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_image_path
  end

  private
    def post_image_params
      params.require(:post_image).permit(:image, :caption, :location)
    end
    def correct_user
    @book = Book.find(params[:id])
    if current_user != @post_image.user
      redirect_to post_images_path
    end
  end
end
