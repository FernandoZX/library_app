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
class BorrowSerializer < ActiveModel::Serializer
  attribute :id
  attribute :user
  attribute :book
  attribute :start_date
  attribute :due_date
  attribute :return_date
  attribute :overdue_date
  attribute :returned
  def user
    user = User.find(@object.user_id)
    UserSerializer.new(user).attributes
  end

  def book
    book = Book.find(@object.book_id)
    BookSerializer.new(book).attributes
  end

  def return_date
    return @object.return_date.strftime('%Y-%m-%d') if @object.return_date
    'TBA'
  end

  def overdue_date
    return @object.overdue_date.strftime('%Y-%m-%d') if @object.overdue_date
    'TBA'
  end
end
