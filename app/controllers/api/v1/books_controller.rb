# frozen_string_literal: true

module Api
  module V1
    # Books Controller
    #
    # @author  [Fernando Cabrera]
    class BooksController < ApplicationController
      before_action :set_book, only: %i[show update destroy]
      before_action :set_books, only: [:index]
      before_action :authorize_current_user


      # GET /books
      def index
        render json: pagination_dict(@books).merge(serialize_collection(@books)),
               root: 'data',
               status: :ok
      end

      # GET /books/1
      def show
        render json: { book: @book }, status: :ok
      end

      # POST /books
      def create
        @book = Book.new(book_params)
        if @book.save
          render json: { book: @book, message: 'Book was successfully created.' }, status: :created
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /books/1
      def update
        if @book.update(book_params)
          render json: { book: @book, message: 'Book was successfully updated.' }, status: :ok
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      # DELETE /books/1.json
      def destroy
        @book.destroy!

        render json: { message: 'Book was successfully destroyed.' }, status: :ok
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def book_params
        params.require(:book).permit(:title, :author, :genre, :isbn, :total_copies)
      end

      def set_books
        page = params[:page] || 1
        limit = set_limit
        data = fetch_book_data
        @books = Kaminari.paginate_array(data.order(created_at: :desc)).page(page).per(limit)
      end

      def fetch_book_data
        query = params[:q]
        if query
          Book.where("lower(title) like '%#{query.downcase}%'")
              .or(Book.where("lower(author) like '%#{query.downcase}%'"))
              .or(Book.where("lower(genre) like '%#{query.downcase}%'"))
        else
          Book.all
        end
      end

      def set_limit
        return Book.count if params[:page].nil?

        params[:limit] || 25
      end

      def authorize_current_user
        authorize(current_devise_api_token.resource_owner, policy_class: BookPolicy)
      end
    end
  end
end
