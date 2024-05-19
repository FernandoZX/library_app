# frozen_string_literal: true

module Api
  module V1
    # Dashboard Controller
    #
    # @author  [Fernando Cabrera]
    class DashboardController < ApplicationController
      before_action :set_total_books, only: :total_books
      before_action :set_total_borrowed_books, only: :total_borrowed_books
      before_action :set_borrowed_due_today_books, only: :due_today_books
      before_action :set_borrowed_overdue_books, only: :overdue_books

      # Librarian Endpoints
      def total_books
        render json: { total_books: @total_books }, status: :ok
      end

      def total_borrowed_books
        render json: { total_borrowed_books: @total_borrowed_books }, status: :ok
      end

      def borrowed_books
        render json: pagination_dict(@borrows).merge(serialize_collection(@borrows)), status: :ok
      end

      def due_today_books
        render json: pagination_dict(@borrows).merge(serialize_collection(@borrows)), status: :ok
      end

      def overdue_books
        render json: pagination_dict(@borrows).merge(serialize_collection(@borrows)), status: :ok
      end

      private

      def set_total_books
        @total_books = Book.count
      end

      def set_total_borrowed_books
        @total_borrowed_books = Borrow.includes(:book, :user).count
      end

      def set_borrowed_books
        page = params[:page] || 1
        limit = set_limit
        data = Borrow.includes(:book, :user)
        @borrows = Kaminari.paginate_array(data.order(created_at: :desc)).page(page).per(limit)
      end

      def set_borrowed_due_today_books
        page = params[:page] || 1
        limit = set_limit
        data = Borrow.includes(:book, :user).where(due_date: DateTime.now)
        @borrows = Kaminari.paginate_array(data.order(created_at: :desc)).page(page).per(limit)
      end

      def set_borrowed_overdue_books
        page = params[:page] || 1
        limit = set_limit
        data = Borrow.includes(:book, :user).where.not(overdue_date: nil)
        @borrows = Kaminari.paginate_array(data.order(created_at: :desc)).page(page).per(limit)
      end

      def set_limit
        return Borrow.includes(:book, :user).count if params[:page].nil?

        params[:limit] || 25
      end
    end
  end
end
