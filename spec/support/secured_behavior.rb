

shared_context 'with authentication' do
  let(:access_token) { 'secret' }
  let(:headers) { { 'Authorization' => "Bearer #{access_token}" } }

  before do
    request.headers['Authorization'] = "Bearer #{access_token}"
  end
end