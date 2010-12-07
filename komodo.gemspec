# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "komodo/version"

Gem::Specification.new do |s|
  s.name        = "komodo"
  s.version     = Komodo::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nicholas Bruning"]
  s.email       = ["nicholas@bruning.com.au"]
  s.homepage    = "http://github.com/thetron/komodo"
  s.summary     = %q{Komodo helps you autoscale delayed_job workers on Heroku}
  s.description = %q{Komodo is a simple wrapper that allows you to scale on-demand the number of delayed_job workers on Heroku, based on the length of your queue.}

  s.rubyforge_project = "komodo"
  
  s.add_dependency 'heroku',        '~> 1.14.6'
  s.add_dependency 'delayed_job',   '~> 2.1.2'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
