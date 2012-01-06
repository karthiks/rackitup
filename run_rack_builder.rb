#source: http://m.onkey.org/ruby-on-rack-2-the-builder

# LESSON: Rack::Builder#run specifies the actual rack application you’re wrapping with Rack::Builder

require 'rubygems'
require 'rack'

infinity = Proc.new { |env| [ 200, {"Content-Type" => "text/html"}, [env.inspect] ] }

# Converting infinity to builder
# builder = Rack::Builder.new
# builder.run infinity

# Or follow the community convention and use block form of Rack::Builder
builder = Rack::Builder.new { run infinity }

Rack::Handler::WEBrick.run builder, :Port => 9292


# Sample Output:
# {
# "GATEWAY_INTERFACE"=>"CGI/1.1", 
# "PATH_INFO"=>"/", 
# "QUERY_STRING"=>"", 
# "REMOTE_ADDR"=>"127.0.0.1", 
# "REMOTE_HOST"=>"localhost", 
# "REQUEST_METHOD"=>"GET", 
# "REQUEST_URI"=>"http://localhost:9292/", 
# "SCRIPT_NAME"=>"", 
# "SERVER_NAME"=>"localhost", 
# "SERVER_PORT"=>"9292", 
# "SERVER_PROTOCOL"=>"HTTP/1.1", 
# "SERVER_SOFTWARE"=>"WEBrick/1.3.1 (Ruby/1.9.2/2011-07-09)", 
# "HTTP_USER_AGENT"=>"Opera/9.80 (X11; Linux i686; U; en) Presto/2.9.168 Version/11.50", 
# "HTTP_HOST"=>"localhost:9292", 
# "HTTP_ACCEPT"=>"text/html, application/xml;q=0.9, application/xhtml+xml, image/png, image/webp, image/jpeg, image/gif, image/x-xbitmap, */*;q=0.1", 
# "HTTP_ACCEPT_LANGUAGE"=>"en-IN,en;q=0.9", 
# "HTTP_ACCEPT_ENCODING"=>"gzip, deflate", 
# "HTTP_CACHE_CONTROL"=>"no-cache", 
# "HTTP_CONNECTION"=>"Keep-Alive", 
# "rack.version"=>[1, 1], 
# "rack.input"=>#, 
# "rack.errors"=>#>, 
# "rack.multithread"=>true, 
# "rack.multiprocess"=>false, 
# "rack.run_once"=>false, 
# "rack.url_scheme"=>"http", 
# "HTTP_VERSION"=>"HTTP/1.1", 
# "REQUEST_PATH"=>"/"
# }
