module NewsApi
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def pagination_attributes(collection, extra_meta = {})
      {
        current_page: collection.current_page,
        next_page: collection.next_page,
        prev_page: collection.prev_page,
        total_pages: collection.total_pages,
        total_count: collection.total_count
      }.merge(extra_meta)
    end
  end
end
