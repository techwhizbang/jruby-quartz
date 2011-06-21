java_import org.quartz.Job

class SimpleJob
  include org.quartz.Job
  @@logger = LoggerFactory.get_logger(self.name)

  def foo
    @@logger.info("testing")
  end

  def execute(context)

  end
end