# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::BorrowsController do
  describe 'routing' do

    it 'routes to #create' do
      expect(post: '/api/v1/borrows').to route_to('api/v1/borrows#create')
    end


  end
end
