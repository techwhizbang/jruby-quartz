import org.quartz.JobDetail
import org.quartz.SchedulerException

module Jobs
  class BaseJobDetail < org.quartz.JobDetail

    attr_accessor :job

    def initialize(name, group, job)
      super()
      set_name name
      set_group group
      @job = job
    end

    def validate
      raise org.quartz.SchedulerException.new("Job's name cannot be null",
        org.quartz.SchedulerException.ERR_CLIENT_ERROR) if get_name == nil
      raise org.quartz.SchedulerException.new("Job's group cannot be null",
        org.quartz.SchedulerException.ERR_CLIENT_ERROR) if get_group == nil
    end

  end
end



