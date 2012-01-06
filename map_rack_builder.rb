#source: http://m.onkey.org/ruby-on-rack-2-the-builder


# LESSON: 
# Rack::Builder#map mounts a stack of rack application/middlewares the specified path or URI and all the children paths under it.


require 'rubygems'
require 'rack'

infinity = Proc.new {|env| [ 200, {"Content-Type" => "text/html"}, [env.inspect] ] }

builder = Rack::Builder.new do
  use Rack::CommonLogger
  
  # Commented because this is not going to work. 
  # Rack::Builder#map also encapsulates a scope within the builder. 
  # And one scope can just have one Rack::Builder#run method.
  # run infinity

  map '/' do
    run infinity
  end

  map '/version' do
    run Proc.new {|env| [ 200, {"Content-Type" => "text/html"}, ["v1.0.0"] ]}

    # Nested map blocks. 
    # Personally, I do not like this one and so commenting it out
    #
    # map '/last' do
    #   run Proc.new {|env| [ 200, {"Content-Type" => "text/html"}, ["v0.8.7"] ]}
    # end
  end

  map '/version/last' do
    run Proc.new {|env| [ 200, {"Content-Type" => "text/html"}, ["v0.8.7"] ]}
  end
end

Rack::Handler::WEBrick.run builder, :Port => 9292
