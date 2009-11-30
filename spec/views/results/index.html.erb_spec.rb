require 'spec_helper'

describe "admin/results/index.html.erb" do
  include ResultsHelper

  before(:each) do
    assigns[:results] = [
      stub_model(Result,
        :start_number => "value for start_number",
        :category => "value for category",
        :team => "value for team",
        :class_general => 1,
        :class_sex => 1,
        :class_category => 1,
        :distance => "value for distance",
        :substitute => "value for substitute",
        :notes => "value for notes",
        :race_id => 1,
        :athlete_id => 1
      ),
      stub_model(Result,
        :start_number => "value for start_number",
        :category => "value for category",
        :team => "value for team",
        :class_general => 1,
        :class_sex => 1,
        :class_category => 1,
        :distance => "value for distance",
        :substitute => "value for substitute",
        :notes => "value for notes",
        :race_id => 1,
        :athlete_id => 1
      )
    ]
  end

  it "renders a list of results" do
    render
    response.should have_tag("tr>td", "value for start_number".to_s, 2)
    response.should have_tag("tr>td", "value for category".to_s, 2)
    response.should have_tag("tr>td", "value for team".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for distance".to_s, 2)
    response.should have_tag("tr>td", "value for substitute".to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
