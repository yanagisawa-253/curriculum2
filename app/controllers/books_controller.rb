class BooksController < ApplicationController
    
    def index
      @books = Book.all
      @book = Book.new
    end
    
    def show
      @book = Book.find(params[:id])
    end
    
    def create
      
    end
    
    def edit
      
    end
    
    def update
       
    end
    
    def destroy
      
    end
    
end
