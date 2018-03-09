require 'rails_helper'

describe NewsController, type: :controller do
  context 'successful request' do
    it 'displays list of news' do
      stub_request(:get, "https://newsapi.org/v2/top-headlines")
        .with(query: test_params, headers: test_headers)
        .to_return(:status => 200, body: news_fixture, headers: {})

      get :index
      expect(response.status).to eq(200)
    end
  end

  context 'when api request fails' do
    it 'redirects to error page' do
      stub_request(:get, "https://newsapi.org/v2/top-headlines")
        .with(query: test_params, headers: test_headers)
        .to_return(:status => 401, body: [], headers: {})

      get :index

      expect(response).to redirect_to(error_path)
    end
  end
end