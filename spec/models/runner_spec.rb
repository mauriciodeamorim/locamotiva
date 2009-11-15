require 'spec_helper'

describe Runner do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :sex => false,
      :birthday => Date.today,
      :cpf => "value for cpf",
      :phone => "value for phone",
      :nick => "value for nick",
      :email => "value for email"
    }
  end

  it "should create a new instance given valid attributes" do
    Runner.create!(@valid_attributes)
  end
end
