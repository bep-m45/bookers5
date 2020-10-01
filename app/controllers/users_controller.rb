class UsersController < ApplicationController
  def index
  end

  def show
  @user = User.find(params[:id])
  @book = Book.new

  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user_image = UserImage.new(post_image_params)
    @user_image.user.id = current_user.id
    @user_image.save
    redirect_to @book
  end

  def update
  end

  private

  def user_params
  params.require(:user).permit(:name, :email, :pass, :image)
  end
end

