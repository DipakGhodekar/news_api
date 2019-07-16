require 'active_model_serializers'
require 'kaminari'
require 'whenever'

module NewsApi
  class Engine < ::Rails::Engine
    isolate_namespace NewsApi

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
  end
end
