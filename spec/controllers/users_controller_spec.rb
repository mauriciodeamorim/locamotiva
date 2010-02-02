require 'spec_helper'

describe UsersController do
    
  it "should use UsersController" do
    controller.should be_an_instance_of(UsersController)
  end

  describe "GET 'new'" do
    it "should be successful" do
      controller.stub!(:require_user).and_return(true)
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      controller.stub!(:require_user).and_return(true)      
      get 'edit'
      response.should be_success
    end
  end
end
