java_import org.quartz.spi.JobFactory
java_import org.quartz.spi.TriggerFiredBundle
java_import org.quartz.JobDetail

module Jobs
  class BaseJobFactory
    include org.quartz.spi.JobFactory

    def new_job bundle
      bundle.get_job_detail.job
    end
  end
end


