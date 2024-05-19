# frozen_string_literal: true

# == Schema Information
#
# Table name: borrows
#
#  id           :bigint           not null, primary key
#  due_date     :datetime         default(Sun, 02 Jun 2024 02:59:25.876526000 UTC +00:00)
#  overdue_date :datetime
#  return_date  :datetime
#  returned     :boolean          default(FALSE)
#  start_date   :datetime         default(Sun, 19 May 2024 02:59:25.876494000 UTC +00:00)
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
require 'rails_helper'

RSpec.describe Borrow do
  pending "add some examples to (or delete) #{__FILE__}"
end
