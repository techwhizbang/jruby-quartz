require 'spec_helper'

module JobScheduler
  describe Configuration do

    context "Given an external YAML file the" do
      subject { Configuration.new(File.expand_path(File.dirname(__FILE__) + "/../fixtures/test_config.yml")) }

      its(:config) { should eq({"log4j_properties_path"=>"/home/scheduled_jobs/config/log4j.properties"}) }
    end

    context "Given the default YAML file the" do
      its(:config) { should eq({"log4j_properties_path"=>"../java/log4j.properties"}) }
    end

  end
end