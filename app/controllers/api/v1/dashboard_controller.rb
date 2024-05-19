# frozen_string_literal: true

module Api
  module V1
    # Dashboard Controller
    #
    # @author  [Fernando Cabrera]
    class DashboardController < ApplicationController
      before_action :set_total_books, only: :total_books
      before_action :set_total_borrowed_books, only: :total_borrowed_books
      before_action :set_borrowed_books, only: :borrowed_books
      before_action :set_borrowed_due_today_books, only: :due_today_books
      before_action :set_borrowed_overdue_books, only: :overdue_books
      before_action :authorize_current_user,
                    except: %i[borrowed_books due_today_books overdue_books]

      # Librarian Endpoints
      def total_books
        render json: { total_books: @total_books }, status: :ok
      end

      def total_borrowed_books
        render json: { total_borrowed_books: @total_borrowed_books }, status: :ok
      end

      def borrowed_books
        render json: pagination_dict(@borrows).merge(serialize_collection(@borrows)),
               root: 'data',
               status: :ok
      end

      def due_today_books
        render json: pagination_dict(@borrows).merge(serialize_collection(@borrows)), root: 'data',
               status: :ok
      end

      def overdue_books
        render json: pagination_dict(@borrows).merge(serialize_collection(@borrows)), root: 'data',
               status: :ok
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
        data = fetch_borrowed_books
        @borrows = Kaminari.paginate_array(data.order(created_at: :desc)).page(page).per(limit)
      end

      def set_borrowed_due_today_books
        page = params[:page] || 1
        limit = set_limit
        data = fetch_borrowed_books.where(due_date: DateTime.now)
        @borrows = Kaminari.paginate_array(data.order(created_at: :desc)).page(page).per(limit)
      end

      def set_borrowed_overdue_books
        page = params[:page] || 1
        limit = set_limit
        data = fetch_borrowed_books.where.not(overdue_date: nil)
        @borrows = Kaminari.paginate_array(data.order(created_at: :desc)).page(page).per(limit)
      end

      def set_limit
        return Borrow.includes(:book, :user).count if params[:page].nil?

        params[:limit] || 25
      end

      def fetch_borrowed_books
        if current_devise_api_token.resource_owner.has_role?(:librarian)
          return Borrow.includes(:book, :user)
        end

        current_devise_api_token.resource_owner.borrows.includes(:book, :user)
      end

      def authorize_current_user
        authorize(current_devise_api_token.resource_owner, policy_class: DashboardPolicy)
      end
    end
  end
end
