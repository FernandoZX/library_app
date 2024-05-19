# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookPolicy, type: :policy do
  subject { described_class.new(user, book) }

  let(:book) { Book.new }

  context 'for a member user' do
    let(:user) { build(:user) }

    before { user.add_role(:member) }

    it { is_expected.to permit_actions(%i[index show]) }
    it { is_expected.to forbid_actions(%i[create update destroy]) }
  end

  context 'for a librarian user' do
    let(:user) { build(:user) }

    before { user.add_role(:librarian) }

    it { is_expected.to permit_all_actions }
  end
end
