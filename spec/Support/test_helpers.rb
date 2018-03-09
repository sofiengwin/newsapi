module Support
  module TestHelpers
    def parsed_json_data
      JSON.parse(response.body, symbolize_names: true)
    end

    def news_fixture
      {
        articles: [{
          source: {id: 'bbc', name: 'BBC'},
          author: 'Test User',
          title: 'test title',
          description: 'test description'
        }]
      }.to_json
    end

    def test_headers
      {
        'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip',
        'User-Agent'=>'unirest-ruby/1.1',
        'X-Api-Key'=> ENV['NEWS_API_KEY']
      }
    end

    def test_params
      {country: 'us', category: 'business'}
    end
  end
end