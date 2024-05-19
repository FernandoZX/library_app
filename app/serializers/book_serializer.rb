# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id           :bigint           not null, primary key
#  author       :string
#  genre        :string
#  isbn         :string
#  title        :string
#  total_copies :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre, :isbn, :total_copies
end
