require 'spec_helper'

describe Race do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :stage => "value for stage",
      :date => Time.now,
      :place => "value for place",
      :distance => "value for distance",
      :url => "value for url"
    }
  end

  it "should create a new instance given valid attributes" do
    Race.create!(@valid_attributes)
  end
end
