module NewsApi
  class ArticleSerializer < ActiveModel::Serializer
    attributes :id,
               :source,
               :author,
               :title,
               :description,
               :url_to_image,
               :url,
               :published_at,
               :content
  end
end
