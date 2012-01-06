# source: http://m.onkey.org/ruby-on-rack-1-hello-rack
# rack gem comes with a bunch of useful stuff to make life easier of a rack application developer.
# rackup is one of them.
# In previous examples - hello_world.rb and simple_proc.rb, 
# we directly used the web server handlers - Rack::Handler::WEBrick or Rack::Handler::Mongrel - and
# even hard-coded the port number.
# With rackup, it is all configurable.
#
# To use rack_up, you need to supply it with rackup config file - config.ru
#
# By convention, you should use .ru extension for the rackup config file.
# Supply it to RackObject and you're done.(See line below. Type it in command prompt.)
# $ rackup config.ru
#
# By default, rackup will start a server on port 9292. 
# But you can override that with a -p option to rackup.

run Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["This Rack app is configured in rackup..."]]}
