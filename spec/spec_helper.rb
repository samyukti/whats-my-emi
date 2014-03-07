require 'sinatra'
require 'rack/test'

root = ::File.expand_path("#{File.dirname(__FILE__)}/..")
require ::File.join( root, 'app' )

set :views, ::File.join( root, 'views' )

module RSpecMixin
  include Rack::Test::Methods
  def app() SinatraApp end
end

RSpec.configure { |c| c.include RSpecMixin }
