# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name   = "jruby-quartz"
  s.summary = "A JRuby implementation of the Quartz scheduling framework that makes it easy to integrate into Ruby and Rails based projects."
  s.version = "1.0"
  s.author = 'Nick Zalabak'
  s.description = "Jruby-Quartz is a wrapper library for the Java based Quartz scheduling framework."
  s.email = 'techwhizbang@gmail.com'
  s.homepage = 'http://techwhizbang.com'
 
  s.has_rdoc = true
  s.extra_rdoc_files = ['README']
  s.rdoc_options << '--title' << 'Jruby-Quartz' << '--main' << 'README' << '--line-numbers'

  s.autorequire = 'jruby-quartz'
  s.files = ['lib/base_scheduler.rb',
             'lib/jruby-quartz.rb',
             'lib/jobs/base_job.rb',
             'lib/jobs/base_job_detail.rb',
             'lib/jobs/base_job_factory.rb',
             'test/integration/jruby_quartz_integration_test.rb',
             'test/unit/base_job_detail_test.rb',
             'test/unit/base_job_factory_test.rb',
             'test/unit/base_job_test.rb',
             'test/unit/base_scheduler_test.rb',
             'test/all_tests.rb',
             'test/test_helper.rb',
             'LICENSE', 
             'README', 
             'Rakefile'].to_a
end
