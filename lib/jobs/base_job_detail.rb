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

  end
end



