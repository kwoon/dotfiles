require_relative 'db/config'

Dir[File.dirname(__FILE__) + '/api/**/*.rb'].each { |file| require file }

class API < Grape::API
  format :json

  get :notes do
    puts User.select(:login).first.login.inspect
    { hello: 'world'}
  end
end

use Rack::Session::Cookie
