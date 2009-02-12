require 'rubygems'
require 'rake/gempackagetask'
require 'rake/rdoctask'

task :default => :test

task :test do
  require File.dirname(__FILE__) + '/test/all_tests.rb'
end

desc 'Generate RDoc'
Rake::RDocTask.new do |task|
  task.main = 'README'
  task.title = 'jruby-quartz'
  task.rdoc_dir = 'doc'
  task.options << "--line-numbers" << "--inline-source"
  task.rdoc_files.include('README', 'lib/**/*.rb')
end

specification = Gem::Specification.new do |s|
	s.name   = "jruby-quartz"
  s.summary = "Jruby-Quartz is a wrapper library for the Java based Quartz scheduling framework."
	s.version = "0.1"
	s.author = 'Nick Zalabak'
	s.description = "Jruby-Quartz is a wrapper library for the Java based Quartz scheduling framework."
	s.email = 'nick@controlaltcreate.com'
  s.homepage = 'http://techwhizbang.com'
  s.rubyforge_project = 'Jruby-Quartz'

  s.has_rdoc = true
  s.extra_rdoc_files = ['README']
  s.rdoc_options << '--title' << 'Jruby-Quartz' << '--main' << 'README' << '--line-numbers'

  s.autorequire = 'jruby-quartz'
  s.files = FileList['{lib,test}/**/*.rb', 'LICENSE', 'README', 'Rakefile'].to_a
	s.test_file = "test/all_tests.rb"
end

Rake::GemPackageTask.new(specification) do |package|
  package.need_zip = false
  package.need_tar = false
end
