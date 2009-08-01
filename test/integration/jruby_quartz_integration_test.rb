require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class IntegrationScheduler < BaseScheduler

  def initialize(cron_expression)
    super
    @job_name = "IntegrationJob"
    @trigger_name = "IntegrationTrigger"
    @base_jobs_group = "IntegrationJobs"
    @base_triggers_group = "IntegrationTriggers"
    @cron_expression = cron_expression
  end
end

class IntegrationJob < Jobs::BaseJob

  def perform_job
    worker_one = mock('worker class one', :whatever => "123")
    worker_two = mock('worker class two', :whatever => '123')
  end
end

class JrubyQuartzIntegrationTest < Test::Unit::TestCase

  def test_scheduler_implementation
    integration_scheduler = IntegrationScheduler.new "0 0/1 * * * ?"

    #must stub the scheduler and scheduler factory to avoid invokation of real Quartz thread pool, etc.
    scheduler = mock('scheduler')
    scheduler_factory = mock('scheduler factory', :get_scheduler => scheduler)

    scheduler.expects(:schedule_job)
    scheduler.expects(:set_job_factory)
    
    integration_scheduler.expects(:scheduler_factory).returns(scheduler_factory)
    integration_scheduler.schedule!(IntegrationJob)
  end
end
