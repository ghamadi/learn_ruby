module Api

  module V1
    class BooksController < ApplicationController
      before_action :set_book, only: [:show, :update, :destroy]
    
      # GET /books
      def index
        @books = Book.all
    
        render json: BooksRepresenter.new(@books).as_json
      end
    
      # GET /books/1
      def show
        render json: BookRepresenter.new(@book).as_json
      end
    
      # POST /books
      def create
        author = nil
        if author_params[:id].nil? && book_params[:author_id].nil?
          author = Author.create!(author_params.except(:id))
        else
          id = book_params[:author_id].nil? ? author_params[:id] : book_params[:author_id]
          author = Author.find(id)
        end
        
        @book = Book.new(book_params.merge({author_id: author.id}))

        if @book.save
          render json: @book, status: :created, location: :api_v1_books
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /books/1
      def update
        if @book.update(book_params)
          render json: @book
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /books/1
      def destroy
        @book.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_book
          @book = Book.find(params[:id])
        end

        def author_params
          params.fetch(:author, {id: nil}).permit(:id, :first_name, :last_name)
        end
    
        # Only allow a list of trusted parameters through.
        def book_params
          params.require(:book).permit(:title, :author_id)
        end
    end
    
  end

end