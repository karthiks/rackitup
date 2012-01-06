#Source: http://m.onkey.org/ruby-on-rack-1-hello-rack

require 'rubygems'
require 'rack'

#Any object responding to call({hash}) by returning [status,{headers},[body]] is good enough to be called a Rack App
Rack::Handler::WEBrick.run proc { |env| [200, {"Content-type" => "text.html"}, ["I'm proc Rack app!"]] }, :Port => 9293
