module JobScheduler
  class Configuration

    attr_reader :config

    def initialize(external_yaml_config = nil)
      if external_yaml_config.nil?
        config_file = File.expand_path(File.dirname(__FILE__) + "/../config/default_config.yml")
      else
        config_file = File.expand_path(external_yaml_config)
        raise "Invalid configuration file path" if config_file.nil?
      end

      @config = YAML.load(ERB.new(File.read(config_file)).result)
    end
  end
end