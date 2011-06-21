require File.expand_path(File.dirname(__FILE__) + "/../lib/jruby-quartz")
#raise $LOAD_PATH.inspect
Dir['**/*_test.rb'].each { |test_case| require test_case }