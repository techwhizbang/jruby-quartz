java_import org.quartz.Job
java_import org.quartz.JobExecutionContext
java_import org.quartz.JobExecutionException

module JobScheduler
  class SimpleJob
    include org.quartz.Job

    def initialize(); end

    def execute(context)
      begin
        execute_task
      rescue Exception => e
        raise JobError.new(e)
      end
    end

    def execute_task
      raise "Subclass must implement the execute_task method"
    end

  end

  class JobError < StandardError ; end
end



