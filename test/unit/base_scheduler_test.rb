require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class BaseSchedulerTest < Test::Unit::TestCase

#  def test_singleton_initialization
#    assert_raise(NoMethodError) { BaseScheduler.new }
#    assert_not_nil(BaseScheduler.instance)
#  end
  
  def test_scheduler_instance_variables
    scheduler = BaseScheduler.new "0 0/1 * * * ?"
    assert_equal scheduler.base_jobs_group, "BaseJobsGroup"
    assert_equal scheduler.job_name, "BaseJob"
    assert_equal scheduler.base_triggers_group, "BaseTriggersGroup"
    assert_equal scheduler.trigger_name, "BaseTrigger"
    assert_equal scheduler.cron_expression, "0 0/1 * * * ?"
  end

  def test_trigger_class
    scheduler = BaseScheduler.new stub
    assert_kind_of(org.quartz.SimpleTrigger, scheduler.send(:trigger).new)
  end

  def test_job_factory_class
    scheduler = BaseScheduler.new stub
    assert_kind_of(Jobs::BaseJobFactory, scheduler.send(:job_factory).new)
  end

  def test_job_detail_class
    scheduler = BaseScheduler.new stub
    assert_kind_of(Jobs::BaseJobDetail, scheduler.send(:job_detail).new("JobName",
                                                                                     'JobGroup',
                                                                                     'JobClass'))
  end

  def test_scheduler_factory_class
    scheduler = BaseScheduler.new stub
    assert_kind_of(StdSchedulerFactory, scheduler.send(:initialize_scheduler_factory))
  end

  def test_cron_trigger_class
    scheduler = BaseScheduler.new stub
    assert_kind_of(CronTrigger, scheduler.send(:cron_trigger).new)
  end

  def test_schedule_method
    base_scheduler = BaseScheduler.new stub
    base_job = mock("base job")
    scheduler = mock('scheduler')
    job_factory = mock('job factory')
    job_detail = mock('job detail')
    cron_trigger = mock('cron trigger')
    scheduler_factory = mock('scheduler factory', :get_scheduler => scheduler)

    base_scheduler.expects(:scheduler_factory).returns(scheduler_factory)
    
    job_factory.expects(:new).returns(job_factory)
    base_job.expects(:new).returns(base_job)
    job_detail.expects(:new).returns(job_detail)
    cron_trigger.expects(:new).returns(cron_trigger)
    
    scheduler.expects(:set_job_factory).with(job_factory)
    scheduler.expects(:schedule_job).with(job_detail, cron_trigger)
    
    base_scheduler.stubs(:job_detail).returns(job_detail)
    base_scheduler.stubs(:job_factory).returns(job_factory)
    base_scheduler.stubs(:cron_trigger).returns(cron_trigger)
    base_scheduler.schedule!(base_job)
  end
end