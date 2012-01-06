#Source: http://m.onkey.org/ruby-on-rack-1-hello-rack

require 'rubygems'
require 'rack'

class HelloWorld
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["I'm HelloWorld Rack app!"]]
  end
end

# Rack::Handler::Mongrel.run HelloWorld.new, :Port => 9292
Rack::Handler::WEBrick.run HelloWorld.new, :Port => 9292
