require 'spec_helper'

describe "admin/races/show.html.erb" do
  include RacesHelper
  before(:each) do
    assigns[:race] = @race = stub_model(Race,
      :name => "value for name",
      :stage => "value for stage",
      :place => "value for place",
      :distance => "value for distance",
      :url => "value for url"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ stage/)
    response.should have_text(/value\ for\ place/)
    response.should have_text(/value\ for\ distance/)
    response.should have_text(/value\ for\ url/)
  end
end
