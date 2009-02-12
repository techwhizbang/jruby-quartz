require 'singleton'

import org.quartz.SchedulerFactory
import org.quartz.SchedulerException
import org.quartz.Scheduler
import org.quartz.JobDetail
import org.quartz.CronTrigger
import org.quartz.SimpleTrigger
import org.quartz.impl.StdSchedulerFactory

class BaseScheduler
  include Singleton
  attr_reader :scheduler_factory

  attr_accessor :base_jobs_group, :base_triggers_group
  attr_accessor :job_name, :trigger_name, :cron_expression

  def fire!(job_class, options={})
    raise Exception.new("Not implemented yet")
  end

  def schedule!(job_class, options={})
    begin
      scheduler = self.scheduler_factory.get_scheduler
      scheduler.set_job_factory(job_factory.new)
      detail = job_detail.new(self.job_name,
                              self.base_jobs_group,
                              job_class.new())

      customer_load_trigger = cron_trigger.new(self.trigger_name,
                                               self.base_triggers_group,
                                               self.job_name,
                                               self.base_jobs_group,
                                               self.cron_expression)

      scheduler.schedule_job(detail, customer_load_trigger)
        
    rescue Exception => e
      raise SchedulerError.new(e)
    end
  end

  protected

  def trigger
    SimpleTrigger
  end

  def initialize_scheduler_factory(options={})
    StdSchedulerFactory.new
  end

  def job_factory
    Jobs::BaseJobFactory
  end

  def job_detail
    Jobs::BaseJobDetail
  end

  def cron_trigger
    CronTrigger
  end

  private

  def initialize
    super
    @scheduler_factory = initialize_scheduler_factory
    @base_jobs_group = "BaseJobsGroup"
    @base_triggers_group = "BaseTriggersGroup"
    @job_name = "BaseJob"
    @trigger_name = "BaseTrigger"
    @cron_expression = "0 0/1 * * * ?"
  end

  class SchedulerError < StandardError; end

end

