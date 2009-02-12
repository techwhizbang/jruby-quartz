require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class BaseJobTest < Test::Unit::TestCase

  def test_initialize
    assert_instance_of(Jobs::BaseJob, Jobs::BaseJob.new)
  end

  def test_quartz_job_implement
    assert_kind_of(org.quartz.Job, Jobs::BaseJob.new)
  end

  def test_execute
    context = mock('context')
    job = Jobs::BaseJob.new
    job.expects(:perform_job)
    job.execute(context)
  end

end