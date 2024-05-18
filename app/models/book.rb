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
  resourcify
  has_many :borrows
end
