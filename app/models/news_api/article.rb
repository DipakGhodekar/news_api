module NewsApi
  class Article < ApplicationRecord
    paginates_per 25

    scope :order_by_published_at_desc, -> { order('published_at DESC') }
  end
end
