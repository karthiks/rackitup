#source: http://m.onkey.org/ruby-on-rack-2-the-builder


# LESSON: 
# Rack::Builder#use adds a middleware to the rack application stack created by Rack::Builder.


require 'rubygems'
require 'rack'

infinity = Proc.new {|env| [ 200, {"Content-Type" => "text/html"}, [env.inspect] ] }

builder = Rack::Builder.new do
  # Rack has many useful middlewares and one of them is Rack::CommonLogger
  # Rack::CommonLogger logs a single line to the supplied log file in the Apache common log format.
  # As we didn’t supply Rack::CommonLogger with an explicit logger, by default it’ll log to env[“rack.errors”]. Hence,
  # you’ll see logging strings in the console for every request.
  use Rack::CommonLogger
  
  run infinity
end

Rack::Handler::WEBrick.run builder, :Port => 9292
