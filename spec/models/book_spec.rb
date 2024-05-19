# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id           :bigint           not null, primary key
#  title        :string
#  author       :string
#  genre        :string
#  isbn         :string
#  total_copies :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Book do
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:isbn) }
  it { is_expected.to validate_presence_of(:genre) }
  it { is_expected.to validate_presence_of(:total_copies) }
  it { is_expected.to validate_numericality_of(:total_copies).only_integer }
  it { should have_many(:borrows).dependent(:destroy).counter_cache }
end
