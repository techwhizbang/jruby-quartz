import org.quartz.spi.JobFactory
import org.quartz.spi.TriggerFiredBundle
import org.quartz.JobDetail

module Jobs
  class BaseJobFactory
    include org.quartz.spi.JobFactory

    def new_job bundle
      bundle.get_job_detail.job
    end
  end
end


