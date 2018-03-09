class News
  def self.fetch
    response = self.new.request

    if response.code == 200
      response.body['articles']
    else
      false
    end
  end

  def request
    Unirest.get('https://newsapi.org/v2/top-headlines', parameters: parameters, headers: headers)
  end

  protected

  def parameters
    {country: 'us', category: 'business'}
  end

  def headers
    {'x-Api-Key' => ENV['NEWS_API_KEY'] }
  end
end