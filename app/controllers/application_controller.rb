class ApplicationController < ActionController::API
  include ActionController::Serialization
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found(exeption)
    render json: "Record not found", status: :not_found
  end
end
