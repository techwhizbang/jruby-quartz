require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class BaseJobDetailTest < Test::Unit::TestCase

  def test_initialization
    assert_instance_of(Jobs::BaseJobDetail, Jobs::BaseJobDetail.new("Name", "Group", "Job"))
  end

  def test_initialization_with_failed_validation
    assert_raise(NativeException) { Jobs::BaseJobDetail.new(nil, nil, nil) }
  end

end