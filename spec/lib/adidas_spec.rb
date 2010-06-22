require 'spec_helper'

describe Adidas do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    pending
    Adidas.create!(@valid_attributes)
  end
  
  it "should build result to determinated athlete and race" do
    pending
    build_result.should == 10
  end
  
end
