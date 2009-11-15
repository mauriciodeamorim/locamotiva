require 'spec_helper'

describe "/races/new.html.erb" do
  include RacesHelper

  before(:each) do
    assigns[:race] = stub_model(Race,
      :new_record? => true,
      :name => "value for name",
      :stage => "value for stage",
      :place => "value for place",
      :distance => "value for distance",
      :url => "value for url"
    )
  end

  it "renders new race form" do
    render

    response.should have_tag("form[action=?][method=post]", races_path) do
      with_tag("input#race_name[name=?]", "race[name]")
      with_tag("input#race_stage[name=?]", "race[stage]")
      with_tag("input#race_place[name=?]", "race[place]")
      with_tag("input#race_distance[name=?]", "race[distance]")
      with_tag("input#race_url[name=?]", "race[url]")
    end
  end
end
