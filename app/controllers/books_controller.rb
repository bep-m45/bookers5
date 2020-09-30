class BooksController < ApplicationController
  
  def new
  
  end
  
  def create
    
  end  
  
  def index
    
  end
  
  def show 
    @book = Book.find(params[:id])
  end 
    
  private
    def book_params
        params.require(:book).permit(:title, :body, :user_id)
    end
end