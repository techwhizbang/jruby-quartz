require 'java'
require 'rubygems'
require 'erb'

libdir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(libdir) unless($LOAD_PATH.include?(libdir) || $LOAD_PATH.include?(File.dirname(__FILE__)))

require 'jobs/configuration'

#simple logging by slf4j
require File.expand_path(File.dirname(__FILE__) + "/java/slf4j-api-1.6.1.jar")
require File.expand_path(File.dirname(__FILE__) + "/java/log4j-1.2.16.jar")
require File.expand_path(File.dirname(__FILE__) + "/java/slf4j-log4j12-1.6.1.jar")

java_import org.apache.log4j.PropertyConfigurator
PropertyConfigurator.configure(File.expand_path(File.dirname(__FILE__) + "/java/log4j.properties"))

java_import org.slf4j.Logger
java_import org.slf4j.LoggerFactory

#quartz library
require File.expand_path(File.dirname(__FILE__) + "/java/quartz-all-2.0.1.jar")

require 'base_scheduler'
require 'jobs/base_job'
require 'jobs/base_job_factory'
require 'jobs/simple_job'


#BaseScheduler.new "0 0/1 * * * ?"
#require File.expand_path(File.dirname(__FILE__) + '/base_scheduler')
#require File.expand_path(File.dirname(__FILE__) + '/jobs/base_job')
#require File.expand_path(File.dirname(__FILE__) + '/jobs/base_job_detail')
#require File.expand_path(File.dirname(__FILE__) + '/jobs/base_job_factory')

module JRubyQuartz
  VERSION = '2.0'
end
