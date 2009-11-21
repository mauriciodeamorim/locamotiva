require 'spec_helper'

describe "admin/races/index.html.erb" do
  include RacesHelper

  before(:each) do
    assigns[:races] = [
      stub_model(Race,
        :name => "value for name",
        :stage => "value for stage",
        :place => "value for place",
        :distance => "value for distance",
        :url => "value for url"
      ),
      stub_model(Race,
        :name => "value for name",
        :stage => "value for stage",
        :place => "value for place",
        :distance => "value for distance",
        :url => "value for url"
      )
    ]
  end

  it "renders a list of races" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for stage".to_s, 2)
    response.should have_tag("tr>td", "value for place".to_s, 2)
    response.should have_tag("tr>td", "value for distance".to_s, 2)
    response.should have_tag("tr>td", "value for url".to_s, 2)
  end
end
