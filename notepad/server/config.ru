require 'bundler'
Bundler.require

require_relative 'api'

run Rack::Cascade.new [API]
