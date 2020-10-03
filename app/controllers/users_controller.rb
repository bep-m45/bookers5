class UsersController < ApplicationController
  def index
  end

  def show
   @user = User.find(params[:id])
   @book = Book.new
   @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user_image = UserImage.new(user_image_params)
    @user_image.user.id = current_user.id
    redirect_to @book

     if @user.save
     redirect_to user_path(@user.id)
     else
      redirect_to 'new'
     end
  end

  def update
       @user = User.find(params[:id])
       if @user.update(user_params)
       flash[:noatice] = 'You have updated user successfully.'
       redirect_to user_path(@user.id)
       else
       render 'edit'
       end
  end

  private

  def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

