java_import org.quartz.SchedulerFactory
java_import org.quartz.SchedulerException
java_import org.quartz.Scheduler
java_import org.quartz.JobDetail
java_import org.quartz.CronTrigger
java_import org.quartz.SimpleTrigger
java_import org.quartz.impl.StdSchedulerFactory

class BaseScheduler
  attr_reader :scheduler_factory

  attr_accessor :base_jobs_group, :base_triggers_group
  attr_accessor :job_name, :trigger_name, :cron_expression
  
  def initialize(cron_expression=nil)
    @scheduler_factory = initialize_scheduler_factory
    @base_jobs_group = "BaseJobsGroup"
    @base_triggers_group = "BaseTriggersGroup"
    @job_name = "BaseJob"
    @trigger_name = "BaseTrigger"
    @cron_expression = cron_expression
  end

  def fire!(job_class, options={})
    begin
      scheduler = scheduler_factory.get_scheduler
      scheduler.trigger_job(self.job_name, self.base_jobs_group)
    rescue Exception => e
      raise SchedulerError.new(e)
    end
  end

  def schedule!(job_class, options={})
    begin
      scheduler = scheduler_factory.get_scheduler
      detail = job_detail_setup(scheduler, job_class)
      current_trigger = cron_trigger.new(self.trigger_name,
                                         self.base_triggers_group,
                                         self.job_name,
                                         self.base_jobs_group,
                                         self.cron_expression)
      scheduler.schedule_job(detail, current_trigger)
    rescue Exception => e
      raise SchedulerError.new(e)
    end
  end

  protected

  def job_detail_setup(scheduler, job_class)
    scheduler.set_job_factory(job_factory.new)
    detail = job_detail.new(self.job_name,
                            self.base_jobs_group,
                            job_class.new())
    detail
  end

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

  class SchedulerError < StandardError; end

end

