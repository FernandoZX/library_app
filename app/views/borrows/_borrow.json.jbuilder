# frozen_string_literal: true

json.extract! borrow, :id, :start_date, :end_date, :status, :user_id, :book_id, :created_at,
              :updated_at
json.url borrow_url(borrow, format: :json)
