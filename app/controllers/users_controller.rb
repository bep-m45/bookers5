class UsersController < ApplicationController
  def index
    
  end

  def show
  @user = User.find(params[:id])
  @book = Book.new
  @books = @user.books
  end

  def edit
  end

  def update
  end

  private
  
  def user_params
  params.require(:user).permit(:name, :email, :pass)
  end

end

