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
class Book < ApplicationRecord
  include ActiveModel::Serialization
  resourcify
  has_many :borrows, counter_cache: true, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :isbn, presence: true
  validates :total_copies, presence: true, numericality: { only_integer: true }
end
