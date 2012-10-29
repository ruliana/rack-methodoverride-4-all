Rack MethodOverride 4 All
===============================

DISCLAIMER: This gem is a rewrite of Rack::MethodOverride. I hacked the original to suit my needs and to provide a nice
gem to whoever needs the same. :)

Rack::MethodOverride checks the "X_HTTP_METHOD_OVERRIDE" header and the query param "_method", however,
it only works for POST methods. Rack::MethodOverride4All works for any method (as long you mark it as "overridable"),
so, if you GET with a url like http://example.com?_method=post the application will see it as a POST request.

(I ignobly copied the text below from **dzello** "https://github.com/dzello/rack-methodoverride-with-params", I found
the info very useful. Pardon me.)

If you are building an application that relies on receiving cross domain requests, right now you really have to stick
with making GET requests from the client. Even with proper CORS headers, browsers still will not behave properly - the
specific problem I ran into is that they will not send cookies in a cross-domain POST - the GET works fine in IE8+,
FFox 3.5+, and in Safari/Chrome.

So, if you want to keep your Rails App RESTful and work around their issue (until "Access-Control-Allow-Credentials"
works properly), one solution is to send everything as a GET, and override as necessary.

See more about CORS at http://http://www.nczonline.net/blog/2010/05/25/cross-domain-ajax-with-cross-origin-resource-sharing/

To use it with Rack Builder
---------------------------

    require 'rack-methodoverride-4-all'
    #...
    use Rack::MethodOverride4All

If you want to allow only "POST" methods to be overridable (as the original Rack::MethodOverride gem), you could:

   use Rack::MethodOverride4All, [:post]

If you plan to use it to operate an API through the browser, you could:

   use Rack::MethodOverride4All, [:get, :post] # Also, this is default

Contrib
---------------
This gem is really tiny, if you want to play with it, clone the thing, run the specs and be happy!

I definitively won't be actively working on this as it is really simple, but if you need something, you can reach
me at github (ruliana) or twitter(@ronie), I'll be glad to help. ^_^

Also, thx to the original author of Rack::MethodOverride, to [Josh Dzielak](http://github.com/dzello) and
[Nick Howard](http://github.com/baroquebobcat) for the code.