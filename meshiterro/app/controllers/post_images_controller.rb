class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    # current_user.idはdevise gemのヘルパーメソッド
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else 
      render new_post_image_path
    end 
  end

  def index
    @post_images = PostImage.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:image, :shop_name, :caption)
  end
end