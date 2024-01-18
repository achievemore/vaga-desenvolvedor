

class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
    @errors ||= ActiveModel::Errors.new(self)
  end

  def call
    validate_token
    self
  end

  attr_reader :errors

  private

  attr_reader :headers

  def validate_token
    return if headers['Authorization'].present?

    @errors.add(:token, :invalid, message: 'Missing token')
  end
end
