# encoding: utf-8

class SinatraApp < Sinatra::Application
  configure :production do
    set :haml, { :ugly=>true }
    set :clean_trace, true
  end

  configure :development do
    # ...
  end

  helpers do
    include Rack::Utils
    alias_method :h, :escape_html
  end
end

 require_relative 'helpers/init'
 require_relative 'routes/init'

