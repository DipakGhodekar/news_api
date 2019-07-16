require_dependency "news_api/application_controller"

module NewsApi
  class Api::V1::ArticlesController < ApplicationController
    def index
      articles = Article.order_by_published_at_desc
                         .page(params[:page])
                         .per(params[:per])

      respond_to do |format|
        format.json do
          render json: articles, meta: pagination_attributes(articles)
        end
      end
    end
  end
end
