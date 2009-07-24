import org.quartz.Job
import org.quartz.JobExecutionContext
import org.quartz.JobExecutionException

module Jobs
  class BaseJob
    include org.quartz.Job
    implement org.quartz.Job

    def initialize(); end

    def execute(context)
      begin
        perform_job
      rescue Exception => e
        raise JobError.new(e)
      end
    end

    def perform_job
      raise "Subclass must implement the perform job method"
    end

  end

  class JobError < StandardError ; end
end



