class BooksController < ApplicationController

  def index

  end


  def new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.find(params[:id])

  end

  def edit
   @book = Book.find(params[:id])
  end

  def update
     @book = Book.find(params[:id])
    if  @book.update(book_params)
    flash[:notice] = "Book was successfully update."
    redirect_to @book
    else
    render "edit"
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