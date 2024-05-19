# frozen_string_literal: true

# == Schema Information
#
# Table name: borrows
#
#  id           :bigint           not null, primary key
#  due_date     :datetime         default(Sun, 02 Jun 2024 06:07:50.566308000 UTC +00:00)
#  overdue_date :datetime
#  return_date  :datetime
#  returned     :boolean          default(FALSE)
#  start_date   :datetime         default(Sun, 19 May 2024 06:07:50.566268000 UTC +00:00)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  book_id      :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_borrows_on_book_id  (book_id)
#  index_borrows_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (user_id => users.id)
#
class Borrow < ApplicationRecord
  include ActiveModel::Serialization
  resourcify
  belongs_to :user
  belongs_to :book

  validates :user, uniqueness: { scope: :book, message: 'Should pick a different book' }

  after_create :decrement_copies
  after_update :increment_copies

  private

  def increment_copies
    Book.increment_counter(:total_copies, book_id, by: 1) if returned
  end

  def decrement_copies
    Book.decrement_counter(:total_copies, book_id, by: 1)
  end
end
