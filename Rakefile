require 'bundler'
Bundler::GemHelper.install_tasks
require 'rspec/core/rake_task'
require 'rake/rdoctask'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

desc 'Generate RDoc'
Rake::RDocTask.new do |rdoc|
  version = JRubyQuartz::VERSION
  task.title = "jruby-quartz #{version}"
  rdoc.rdoc_dir = 'rdoc'
  rdoc.rdoc_files.include('README*', 'lib/**/*.rb')
end