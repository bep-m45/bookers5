class BooksController < ApplicationController

  def index

  end


  def new

  end

  def create
    @book = Book.new(book_params)
     if @book.save
      flash[:notice] = 'You have creatad book successfully.'
      redirect_to book_path(@book.id)
     else
      render :'show'
     end
  end

  def show
  @user = User.find(params[:id])
  @book = Book.find(params[:id])
  @books = @user.books
  end

  def edit
   @book = Book.find(params[:id])
  end

  def update

     @book = Book.find(params[:id])
     if @book.update(book_params)
        flash[:notice] ='You have updated book successfully.'
        redirect_to @book
     else
      redirect_to 'edit'
     end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to @book
  end

  private

    def book_params
     params.require(:book).permit(:title, :body)
    end
end
