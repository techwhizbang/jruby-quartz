require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class BaseSchedulerTest < Test::Unit::TestCase

  def test_singleton_initialization
    assert_raise(NoMethodError) { BaseScheduler.new }
    assert_not_nil(BaseScheduler.instance)
  end
  
  def test_scheduler_instance_variables
    assert_equal BaseScheduler.instance.base_jobs_group, "BaseJobsGroup"
    assert_equal BaseScheduler.instance.job_name, "BaseJob"
    assert_equal BaseScheduler.instance.base_triggers_group, "BaseTriggersGroup"
    assert_equal BaseScheduler.instance.trigger_name, "BaseTrigger"
    assert_equal BaseScheduler.instance.cron_expression, "0 0/1 * * * ?"
  end

  def test_trigger_class
    assert_kind_of(org.quartz.SimpleTrigger, BaseScheduler.instance.send(:trigger).new)
  end

  def test_job_factory_class
    assert_kind_of(Jobs::BaseJobFactory, BaseScheduler.instance.send(:job_factory).new)
  end

  def test_job_detail_class
    assert_kind_of(Jobs::BaseJobDetail, BaseScheduler.instance.send(:job_detail).new("JobName",
                                                                                     'JobGroup',
                                                                                     'JobClass'))
  end

  def test_scheduler_factory_class
    assert_kind_of(StdSchedulerFactory, BaseScheduler.instance.send(:initialize_scheduler_factory))
  end

  def test_cron_trigger_class
    assert_kind_of(CronTrigger, BaseScheduler.instance.send(:cron_trigger).new)
  end

  def test_schedule_method
    base_job = mock("base job")
    scheduler = mock('scheduler')
    job_factory = mock('job factory')
    job_detail = mock('job detail')
    cron_trigger = mock('cron trigger')
    scheduler_factory = mock('scheduler factory', :get_scheduler => scheduler)

    job_factory.expects(:new).returns(job_factory)
    base_job.expects(:new).returns(base_job)
    job_detail.expects(:new).returns(job_detail)
    cron_trigger.expects(:new).returns(cron_trigger)
    
    scheduler.expects(:set_job_factory).with(job_factory)
    scheduler.expects(:schedule_job).with(job_detail, cron_trigger)
    BaseScheduler.instance.expects(:scheduler_factory).returns(scheduler_factory)
    
    BaseScheduler.instance.stubs(:job_detail).returns(job_detail)
    BaseScheduler.instance.stubs(:job_factory).returns(job_factory)
    BaseScheduler.instance.stubs(:cron_trigger).returns(cron_trigger)
    BaseScheduler.instance.schedule!(base_job)
  end
end