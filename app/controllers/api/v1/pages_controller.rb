# frozen_string_literal: true

module Api
  module V1
    class PagesController < ApplicationController
      def restricted
        devise_api_token = current_devise_api_token
        if devise_api_token
          render json: { message: "You are logged in as #{devise_api_token.resource_owner.email}" },
                 status: :ok
        else
          render json: { message: 'You are not logged in' }, status: :unauthorized
        end
      end
    end
  end
end
