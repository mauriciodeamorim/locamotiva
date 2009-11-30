require 'spec_helper'

describe "admin/results/new.html.erb" do
  include ResultsHelper

  before(:each) do
    assigns[:result] = stub_model(Result,
      :new_record? => true,
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

  it "renders new result form" do
    render

    response.should have_tag("form[action=?][method=post]", results_path) do
      with_tag("input#result_start_number[name=?]", "result[start_number]")
      with_tag("input#result_category[name=?]", "result[category]")
      with_tag("input#result_team[name=?]", "result[team]")
      with_tag("input#result_class_general[name=?]", "result[class_general]")
      with_tag("input#result_class_sex[name=?]", "result[class_sex]")
      with_tag("input#result_class_category[name=?]", "result[class_category]")
      with_tag("input#result_distance[name=?]", "result[distance]")
      with_tag("input#result_substitute[name=?]", "result[substitute]")
      with_tag("textarea#result_notes[name=?]", "result[notes]")
      with_tag("input#result_race_id[name=?]", "result[race_id]")
      with_tag("input#result_athlete_id[name=?]", "result[athlete_id]")
    end
  end
end
