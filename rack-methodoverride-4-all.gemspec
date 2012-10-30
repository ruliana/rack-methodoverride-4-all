# encoding: utf-8
Gem::Specification.new do |gem|
  gem.authors       = ['Ronie Uliana']
  gem.email         = ['ronie.uliana@gmail.com']
  gem.description   = %q{A replacement for Rack::MethodOverride that allows you to choose which methods are overridable}
  gem.summary       = %q{Rack::MethodOverride checks the "X_HTTP_METHOD_OVERRIDE" and the query param "_method", however, it only works for POST methods. Rack::MethodOverride4All works for any method (as long you mark it as "overridable"), so, if you GET xml with a url like http://example.com/?_method=delete the application will see it as a delete request.}
  gem.homepage      = 'http://github.com/ruliana/rack-methodoverride-4-all'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rack-methodoverride-4-all"
  gem.require_paths = ['lib']
  gem.version       = '1.0.3'

  gem.add_dependency 'rack', '~>1.4.1'

  gem.add_development_dependency 'rack-test', '~>0.6.0'
  gem.add_development_dependency 'rspec', '~>2.11.0'
  gem.add_development_dependency 'guard-rspec', '~>2.1.0'
  gem.add_development_dependency 'rb-inotify', '~>0.8.0'
end
