class ApplicationController < ActionController::API
  include ActionController::Serialization

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
