# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BorrowPolicy, type: :policy do
  subject { described_class.new(user, borrow) }

  let(:book) { create(:book) }
  let(:borrow) { build(:borrow, user: user, book: book) }

  context 'for a librarian user' do
    let(:user) { build(:user) }

    before { user.add_role(:librarian) }

    it { is_expected.to forbid_actions(%i[create return_book]) }
    it { is_expected.to permit_actions(%i[mark_returned mark_overdue]) }
  end

  context 'for a member user' do
    let(:user) { build(:user) }

    before { user.add_role(:member) }

    it { is_expected.to permit_actions(%i[create return_book]) }
    it { is_expected.to forbid_actions(%i[mark_returned mark_overdue]) }
  end
end
