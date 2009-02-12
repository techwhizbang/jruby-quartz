require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class BaseJobFactoryTest < Test::Unit::TestCase

  def test_new_job
    job = mock('job')
    job_detail = mock('job detail', :job => job)
    bundle = mock('bundle', :get_job_detail => job_detail)
    Jobs::BaseJobFactory.new.new_job(bundle)
  end

end