The Objective:
--------------

This project is my rack app learning playground. Nothing more. Nothing less.


The Learning Steps:
-------------------
  - hello_world.rb
    - In this you will know what rack is all about
  - simple_proc.rb
    - In this you will learn how simpler rack app can be
  - config.ru
    - Here you will get to understand rackup gem utility.
  - run_rack_builder.rb
    - What Rack::Builder#run does?
  - use_rack_builder.rb
    - What Rack::Builder#use does?
  - map_rack_builder.rb
    - What Rack::Builder#map does?
  - infinity.ru
    - Understanding rackup holistically
  - What next?


Quick Ref:
----------
  - Rack provides a minimal, modular and adaptable interface for developing web applications in Ruby. By wrapping HTTP requests and responses in the simplest way possible, it unifies and distills the API for web servers, web frameworks, and software in between (the so-called middleware) into a single method call.
    Rack provides an interface between different web servers and your framework/application. Making it very simple for your framework/application to be compatible with any webserver that supports Rack – Phusion Passenger, Litespeed, Mongrel, Thin, Ebb, Webrick to name a few.
  - Practically speaking, you can divide “Rack” in two parts :
    - Rack specification specifies how exactly a Rack application and the web server should communicate :
      A Rack application is an Ruby object (not a class) that responds to call. It takes exactly one argument, the environment and returns an Array of exactly three values: The status, the headers, and the body.
    - Rack gem is a collection of utilities and facilitating classes, to make life easier for anyone developing Rack applications. It includes basic implementations of request, response, cookies & sessions. And a good number of usefult middlewares. (For this, you have to install the rack gem.)
  - Rack::Builder implements a small DSL to iteratively construct Rack applications.
    Rack::Builder is the thing that glues various Rack middlewares and applications together and convert them into a single entity/rack application. A good analogy is comparing Rack::Builder object with a stack, where at the very bottom is your actual rack application and all middlewares on top of it, and the whole stack itself is a rack application too.
  - Rack::Builder instance methods you should care about:
    - Rack::Builder#run specifies the actual rack application you are wrapping with Rack::Builder
    - Rack::Builder#use adds a middleware to the rack application stack
    - Rack::Builder#map mounts a stack of rack application/middlewares the specified path or URI and all the children paths under it. 
      When you have multiple map blocks, URIs are tried from longest length to shortest length.
  - Makes it possible to use multiple frameworks for the same application, provided there is no class collision. Rails and sinatra integration is a good example of this.


Miscelaneous Info:
------------------
Git recommends adding README.md

The page that details on the markup supported: https://github.com/github/markup#readme


Sources:
--------
  - http://guides.rubyonrails.org/rails_on_rack.html
  - http://m.onkey.org/ruby-on-rack-1-hello-rack
  - http://m.onkey.org/ruby-on-rack-2-the-builder
  - http://jasonseifer.com/2009/04/08/32-rack-resources-to-get-you-started
  - http://rack.rubyforge.org/doc/
  - http://rack.rubyforge.org/doc/files/SPEC.html
