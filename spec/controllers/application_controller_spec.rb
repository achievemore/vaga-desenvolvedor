RSpec.describe ApplicationController, type: :controller do
  controller do
    # Definido um dummy controller e action
    def index
      raise ActiveRecord::RecordNotFound if params[:foo]

      render json: { message: 'Hello!' }, status: :ok
    end
  end

  describe 'not authorized' do
    it 'returns a not found response' do
      get :index

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe '#authenticate_request' do
    include_context 'with authentication'

    it 'returns a success response' do
      get :index

      expect(response).to be_successful
    end
  end

  describe '#exception_handler' do
    include_context 'with authentication'

    it 'returns a not found response' do
      get :index, params: { foo: 'bar' }

      expect(response).to have_http_status(:not_found)
    end

    it 'returns internal server error' do
      allow(AuthorizeApiRequest).to receive(:new).and_raise(StandardError)

      get :index

      expect(response).to have_http_status(:internal_server_error)
    end
  end
end
