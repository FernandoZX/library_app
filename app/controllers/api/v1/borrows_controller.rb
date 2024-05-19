# frozen_string_literal: true

module Api
  module V1
    # Borrows Controller
    #
    # @author  [Fernando Cabrera]
    class BorrowsController < ApplicationController
      before_action :authorize_current_user
      before_action :set_book, only: %i[create return_book mark_returned mark_overdue]
      before_action :book_has_copies?, only: :create
      before_action :set_borrow, only: %i[show return_book mark_returned mark_overdue]
      before_action :returned?, only: :mark_returned
      before_action :was_returned?, only: %i[return_book mark_returned]
      before_action :overdue?, only: :mark_overdue
      

      # GET /borrows
      # GET /borrows.json
      def index
        @borrows = Borrow.all
      end

      # GET /borrows/1
      # GET /borrows/1.json
      def show; end

      # POST /borrows
      # POST /borrows.json
      def create
        borrow = current_devise_api_token.resource_owner.borrows.create!(book: @book)

        render json: borrow, adapter: :attributes, status: :created
      end
      # PATCH/PUT /borrows/1.json

      def return_book
        if @borrow.update({ return_date: DateTime.now })
          render json: @borrow, adapter: :attributes, status: :ok
        else
          render json: @borrow.errors, status: :unprocessable_entity
        end
      end
      # PATCH/PUT /borrows/1
      # PATCH/PUT /borrows/1.json

      def mark_returned
        if @borrow.update({ returned: true })
          render json: @borrow, adapter: :attributes, status: :created
        else
          render json: @borrow.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /borrows/1.json
      def mark_overdue
        if @borrow.update({ overdue_date: DateTime.now })
          render :show, status: :ok, location: @borrow
        else
          render json: @borrow.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_borrow
        @borrow = Borrow.find_by!(user: current_devise_api_token.resource_owner, book: @book)
      end

      def set_book
        @book = if borrow_params[:book].to_i.zero?
                  Book.where("lower(title) like '%#{borrow_params[:book].downcase}%'").first!
                else
                  Book.find(borrow_params[:book].to_i)
                end
      end

      def book_has_copies?
        return false if @book.total_copies.positive?

        message = "Unfortunately this book #{@book.title} currently out stock"
        render_custom_error(message)
      end

      def returned?
        return false if @borrow.return_date.present?

        message = "Unfortunately this book #{@book.title} can't mark as returned"
        render_custom_error(message)
      end

      def was_returned?
        if @borrow.return_date.present? || @borrow.returned
          message = "This book #{@book.title} was returned"
          render_custom_error(message)
        end
        false
      end

      def overdue?
        return false if DateTime.now < @borrow.return_date

        date = @borrow.return_date
        message = "Unfortunately this book #{@book.title} can't mark as overdue date after this day #{date}"
        render_custom_error(message)
      end

      # Only allow a list of trusted parameters through.
      def borrow_params
        params.require(:borrow).permit(:book)
      end

      def authorize_current_user
        authorize(current_devise_api_token.resource_owner, policy_class: BorrowPolicy)
      end
    end
  end
end
