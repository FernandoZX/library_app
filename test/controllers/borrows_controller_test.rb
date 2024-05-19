# frozen_string_literal: true

require 'test_helper'

class BorrowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @borrow = borrows(:one)
  end

  test 'should get index' do
    get borrows_url, as: :json
    assert_response :success
  end

  test 'should create borrow' do
    assert_difference('Borrow.count') do
      post borrows_url,
           params: { borrow: { book_id: @borrow.book_id, end_date: @borrow.end_date, start_date: @borrow.start_date, status: @borrow.status, user_id: @borrow.user_id } }, as: :json
    end

    assert_response :created
  end

  test 'should show borrow' do
    get borrow_url(@borrow), as: :json
    assert_response :success
  end

  test 'should update borrow' do
    patch borrow_url(@borrow),
          params: { borrow: { book_id: @borrow.book_id, end_date: @borrow.end_date, start_date: @borrow.start_date, status: @borrow.status, user_id: @borrow.user_id } }, as: :json
    assert_response :success
  end

  test 'should destroy borrow' do
    assert_difference('Borrow.count', -1) do
      delete borrow_url(@borrow), as: :json
    end

    assert_response :no_content
  end
end
