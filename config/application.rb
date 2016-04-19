require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Khaiyekhabo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.cache_classes = true
    config.consider_all_requests_local = false
    config.action_controller.perform_caching = true
    config.serve_static_files = true
    config.assets.compress = true
    config.assets.compile = true

    config.assets.precompile += %w( chartkick.js )
    config.assets.precompile += %w( custom.css )
    config.assets.precompile += %w( camera.css )
    config.assets.precompile += %w( style.css)
    config.assets.precompile += %w( bootstrap-responsive.min.css)
    config.assets.precompile += %w( bootstrap-responsive.css)
    config.assets.precompile += %w( bootstrap.min.css)
    config.assets.precompile += %w( bootstrap.css)
    config.assets.precompile += %w( reset.css)
    config.assets.precompile += %w( font-awesome.css)
    config.assets.precompile += %w( fontawesome-webfont.eot)
    config.assets.precompile += %w( fontawesome-webfont.ttf)
    config.assets.precompile += %w( fontawesome-webfont.woff)
    config.assets.precompile += %w( FontAwesome.otf)
    config.assets.precompile += %w( font-awesome.min.css)
    config.assets.precompile += %w( social_foundicons.css)
    config.assets.precompile += %w( social_foundicons.eot)
    config.assets.precompile += %w( social_foundicons.svg)
    config.assets.precompile += %w( social_foundicons.ttf)
    config.assets.precompile += %w( social_foundicons.woff)
    config.assets.precompile += %w( general_foundicons.css)
    config.assets.precompile += %w( general_foundicons.eot)
    config.assets.precompile += %w( jquery.raty.js )
    config.assets.precompile += %w( camera.min.js )
    config.assets.precompile += %w( jquery.min.js )
    config.assets.precompile += %w( bootstrap.min.js )
    config.assets.precompile += %w( bootstrap.js )
    config.assets.precompile += %w( default.js )
    config.assets.precompile += %w( jquery.carouFredSel-6.2.0-packed.js )
    config.assets.precompile += %w( jquery.easing.1.3.js )
    config.assets.precompile += %w( jquery.wookmark.js )    	
    config.assets.precompile += %w( jquery.prettyPhoto.js )
    config.assets.precompile += %w( ratyrate.js )    		    
config.i18n.fallbacks = true
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
