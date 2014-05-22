require 'rails_12factor'
require 'sorcery'
require 'bcrypt'
require 'slim'
require 'turbolinks'
require 'jquery-rails'
require 'compass-rails'
require 'chronic'
require 'stringex'
require 'kramdown'
require 'coderay'
require 'kaminari'
require 'aws-sdk'

module Obtvse
  class Engine < ::Rails::Engine
    isolate_namespace Obtvse

    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    initializer :add_assets do |app|
      app.config.assets.precompile += %w{ obtvse/admin.js obtvse/application.css obtvse/application.js }
    end
  end
end
