class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # この記述の仕方はモデルがアソシエーションを持っているから
    @post_images = @user.post_images.page(params[:page])
  end
# before_actionでユーザ確認を先にしている
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end

end
