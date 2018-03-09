require 'rails_helper'

describe News do
  describe '.fetch' do
    context 'successful request' do
      it 'returns news' do
        stub_request(:get, "https://newsapi.org/v2/top-headlines")
          .with(query: test_params, headers: test_headers)
          .to_return(:status => 200, body: news_fixture, headers: {})

        result = News.fetch
        expect(result[0]['author']).to eq 'Test User'
        expect(result[0]['title']).to eq 'test title'
        expect(result[0]['description']).to eq 'test description'
        expect(result[0]['source']['name']).to eq 'BBC'

      end
    end

    context 'unsucessful request' do
      it 'raises ApiRequestError error' do
        stub_request(:get, "https://newsapi.org/v2/top-headlines")
          .with(query: test_params, headers: test_headers)
          .to_return(status: 422, body: [], headers: {})

        expect(News.fetch).to eq false
      end
    end
  end
end