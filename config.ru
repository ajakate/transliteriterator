# encoding: utf-8

# environment
ENV['RACK_ENV'] ||= 'development'

# bootstap app logic
require './lib/transl'

# sinatra app
require './transl_app'

map '/' do
  run TranslApp
end