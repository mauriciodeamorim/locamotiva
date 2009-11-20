require 'spec_helper'

describe Result do
  before(:each) do
    @valid_attributes = {
      :start_number => "value for start_number",
      :category => "value for category",
      :team => "value for team",
      :liquid_time => Time.now,
      :official_time => Time.now,
      :class_general => 1,
      :class_sex => 1,
      :class_category => 1,
      :pace => Time.now,
      :distance => "value for distance",
      :substitute => "value for substitute",
      :notes => "value for notes",
      :race_id => 1,
      :athlete_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Result.create!(@valid_attributes)
  end
end
