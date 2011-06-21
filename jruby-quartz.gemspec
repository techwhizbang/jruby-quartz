# -*- encoding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + "/lib/jruby-quartz")

Gem::Specification.new do |s|
  s.name   = "jruby-quartz"
  s.summary = "A JRuby wrapper around the Quartz job scheduling framework."
  s.version = JRubyQuartz::VERSION
  s.author = 'Nick Zalabak'
  s.description = "jruby-quartz is a wrapper around the Java based Quartz job scheduling framework."
  s.email = 'techwhizbang at gmail dot com'
  s.homepage = 'https://github.com/techwhizbang/jruby-quartz'
  s.platform         = 'java'
  s.rubygems_version = %q{1.3.6}
  s.has_rdoc = true
  s.extra_rdoc_files = ['README']
  s.rdoc_options << '--title' << 'jruby-quartz' << '--main' << 'README' << '--line-numbers'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_development_dependency "rspec", "2.6.0"
  s.add_development_dependency "mocha", "0.9.12"
  s.add_dependency "rake", "0.8.7"
end
