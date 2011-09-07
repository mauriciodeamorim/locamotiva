require 'spec_helper'

describe "Athletes" do
  describe "GET /athletes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get athletes_path
      response.status.should be(200)
    end
  end
end
