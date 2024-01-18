class ApplicationController < ActionController::API
  include ActionController::Serialization

  before_action :authenticate_request

  def authenticate_request
    @auth = AuthorizeApiRequest.new(request.headers).call

    render json: { error: 'Not Authorized' }, status: :unauthorized unless @auth.errors.empty?
  end

  rescue_from Exception, with: :exception_handler

  def exception_handler(exception)
    case exception
    when ActiveRecord::RecordNotFound, ActionController::UnknownController, ActionController::RoutingError
      render json: { message: 'Not found' }, status: :not_found
    else
      render json: { message: 'Internal error' }, status: :internal_server_error
    end
  end
end
