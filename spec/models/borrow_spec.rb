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
require 'rails_helper'

RSpec.describe Borrow do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  subject { build(:borrow, user: user, book: book ) }

  it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:book_id).with_message('Should pick a different book') }

  it { is_expected.to validate_presence_of(:user_id) }
  it { should belong_to(:user) }

  it { is_expected.to validate_presence_of(:book_id) }
  it { should belong_to(:book) }
end
