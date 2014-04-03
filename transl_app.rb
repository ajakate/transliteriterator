# encoding: utf-8
class TranslApp < Sinatra::Base

  # Middleware
  register Sinatra::AssetPack

  configure do
    set :ifs_url, 'https://uat.inventory.ifs.origin-api.manheim.com'
  end
  
  use Rack::Lint
  use Rack::Runtime

  # Assets
  assets {
    serve '/javascripts',     from: 'assets/javascripts'
    serve '/stylesheets',    from: 'assets/stylesheets'
    serve '/images',    from: 'assets/images'

    js :html5shiv, '/js/html5shiv.js', [
      '/javascripts/html5shiv.js',
    ]

    js :app, '/js/app.js', [
      '/javascripts/jquery.js',
      '/javascripts/underscore.js',
      '/javascripts/backbone.js',
      '/javascripts/moment.js',
      '/javascripts/app.js'
    ]

    css :app, '/css/app.css', [
      '/stylesheets/app.css'
    ]

    js_compression :uglify
    css_compression :sass
  }
  
  get '/' do
    slim :index
  end

  post '/' do
    @query =  params[:query]
    slim :result
  end

end
