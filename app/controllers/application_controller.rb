# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include JSONAPI::ActsAsResourceController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_devise_api_token!

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def pagination_dict(collection)
    {
      total: collection.total_count,
      perPage: collection.limit_value,
      currentPage: collection.current_page,
      lastPage: collection.total_pages
    }
  end

  def serialize_collection(collection)
    ActiveModelSerializers::SerializableResource.new(collection, root: :data).serializable_hash
  end

  def pundit_user
    current_devise_api_token.resource_owner
  end

  def user_not_authorized
    render json: { status: 401, message: 'You don\'t have permissions to access this area', displayString: 'You don\'t have permissions to access this area' },
           status: :not_found
  end

  def not_found(error)
    render json: { status: 404, message: error.message, displayString: error.message },
           status: :not_found
  end

  def record_invalid(error)
    Rails.logger.info(error.message)
    render json: { status: 422, message: error.message, displayString: error.message },
           status: :unprocessable_entity
  end

  def render_custom_error(message)
    render json: {
             status: 422,
             message: message,
             displayString: message
           },
           status: :unprocessable_entity
  end

end
