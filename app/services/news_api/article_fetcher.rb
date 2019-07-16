require 'net/http'

module NewsApi
  module ArticleFetcher
    extend self

    def load_articles
      cricket_articles['articles'].each do |api_article|
        article = Article.find_or_initialize_by(title: api_article['title'])
        if article.new_record?
          article.source = api_article['source']['name']
          article.author = api_article['author']
          article.title = api_article['title']
          article.description = api_article['description']
          article.url_to_image = api_article['urlToImage']
          article.url = api_article['url']
          article.published_at = api_article['publishedAt']
          article.content = api_article['content']
          article.save
        end
      end
      puts "Articles loaded at #{Time.now}"
    end

    private

    def cricket_articles
      uri = URI('https://newsapi.org/v2/everything')
      uri.query = URI.encode_www_form(
        sources: 'espn-cric-info',
        apiKey: "7b8ed4cd17d74f7aaec0c3d1d2007eaa", #Rails.application.secrets.news_api_key,
        pageSize: 100
      )
      response = Net::HTTP.get_response(uri)
      JSON.parse(response.body)
    end
  end
end