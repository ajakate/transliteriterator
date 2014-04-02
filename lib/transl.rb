# load path
lib_path = File.expand_path('../', __FILE__)
($:.unshift lib_path) unless ($:.include? lib_path)

require 'sinatra/base'
require 'sinatra/assetpack'
require 'slim'
require 'httparty'
require 'securerandom'

gem 'bing_translator'

require 'remarkt/unit'