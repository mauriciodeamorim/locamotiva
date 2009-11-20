require 'spec_helper'

describe "/results/show.html.erb" do
  include ResultsHelper
  before(:each) do
    assigns[:result] = @result = stub_model(Result,
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
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ start_number/)
    response.should have_text(/value\ for\ category/)
    response.should have_text(/value\ for\ team/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ distance/)
    response.should have_text(/value\ for\ substitute/)
    response.should have_text(/value\ for\ notes/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
