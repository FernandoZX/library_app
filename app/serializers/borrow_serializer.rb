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
