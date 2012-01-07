# source: http://m.onkey.org/ruby-on-rack-2-the-builder

# Rack::Builder → rackup

# As I mentioned above, rackup converts the supplied rack config file to an instance of Rack::Builder. This is how is happens under the hood ( just so you get an idea ) :
### config_file = File.read(config)
### rack_application = eval("Rack::Builder.new { #{config_file} }")

# And then rackup supplies rack_application to the respective webserver :
### server.run rack_application, options

# In short, rack config files are evaluated within the context of a Rack::Builder object. 
# So if we convert infinity to a rack config file which rackup can understand, we are done.

require 'rubygems'
require 'rack'

HTTP_OK = 200
response_headers = {"Content-Type" => "text/html"}

message = "Know what! rackup takes the rack config files and evaluates it within the context of a Rack::Builder object, 
           that is given to the server rack handler to run it as Rack app."
infinity = Proc.new { |env| [ HTTP_OK, response_headers, [message] ] }

use Rack::CommonLogger

map '/' do
  run infinity
end

map '/version' do
  run Proc.new { |env| [ HTTP_OK, response_headers, ["v2.0.0"] ] }
end

map '/version/last' do
  run Proc.new { |env| [HTTP_OK, response_headers, ["v1.0.0"] ] }
end
