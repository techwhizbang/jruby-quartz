java_import org.quartz.JobBuilder

module JobScheduler
  class JobBuilder
    include org.quartz.spi.JobFactory

    def initialize(job_class)
      bundle.get_job_detail.job
    end
  end
end


