class BooksController < ApplicationController
    
    def index
      @books = Book.all
      @user = current_user
      @book = Book.new
    end
    
    def show
      @book = Book.find(params[:id])
      # @book.user_id = current_user.id
      @books = Book.new
      @user = @book.user
    end
    
    def create
      @book = Book.new(book_params)
      # @book.user_id = current_user.id
      @user = current_user
      if @book.save
        flash[:notice] = 'You have created book successfully.'
        redirect_to book_path(@book.id)
      else
        @books = Book.all
        render 'index'
      end
    end
    
    def edit
      @book = Book.find(params[:id])
    end
    
    def update
       
    end
    
    def destroy
      
    end
    
    private
    def book_params
      params.require(:book).permit(:name, :body, :user_id)
    end
end
