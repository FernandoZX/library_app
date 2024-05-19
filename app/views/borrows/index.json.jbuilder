# frozen_string_literal: true

json.array! @borrows, partial: 'borrows/borrow', as: :borrow
