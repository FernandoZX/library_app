require 'rails_helper'

RSpec.describe DashboardPolicy, type: :policy do
  subject { described_class.new(user, nil) }

  context 'for a member user' do
    let(:user) { build(:user) }

    before { user.add_role(:member) }

    it { is_expected.to forbid_actions(%i[total_books total_borrowed_books]) }
  end

  context 'for a librarian user' do
    let(:user) { build(:user) }

    before { user.add_role(:librarian) }

    it { is_expected.to permit_actions(%i[total_books total_borrowed_books]) }
  end
end
