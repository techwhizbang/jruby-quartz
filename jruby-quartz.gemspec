# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name   = "jruby-quartz"
  s.summary = "A JRuby implementation of the Quartz scheduling framework that makes it easy to integrate into Ruby and Rails based projects."
  s.version = "0.1"
  s.author = 'Nick Zalabak'
  s.description = "Jruby-Quartz is a wrapper library for the Java based Quartz scheduling framework."
  s.email = 'nick@controlaltcreate.com'
  s.homepage = 'http://techwhizbang.com'
 
  s.has_rdoc = true
  s.extra_rdoc_files = ['README']
  s.rdoc_options << '--title' << 'Jruby-Quartz' << '--main' << 'README' << '--line-numbers'

  s.autorequire = 'jruby-quartz'
  s.files = ['lib/**/*.rb', 'test/**/*.rb', 'LICENSE', 'README', 'Rakefile'].to_a
  s.test_file = "test/all_tests.rb"
end
