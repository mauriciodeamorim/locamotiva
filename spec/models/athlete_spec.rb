require 'spec_helper'

describe Athlete do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :sex => "value for sex",
      :birthday => Date.today,
      :cpf => "value for cpf",
      :phone => "value for phone",
      :nick => "value for nick",
      :email => "value for email"
    }
  end

  it "should create a new instance given valid attributes" do
    Athlete.create!(@valid_attributes)
  end
end
