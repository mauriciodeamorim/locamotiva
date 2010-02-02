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

  it "should search results" do
    id_client = 20
    id_event = 44
    athletes = ["john", "peter", "neighbor"]
    result = Result.new
    # x = result.should_receive(:search_results).with(id_client).and_return([{:start_number => 1}, {:start_number => 2}])
    result.search_results(20).should == [{:start_number => 1}, {:start_number => 2}]
  end
end
