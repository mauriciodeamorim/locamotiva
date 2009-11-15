require 'spec_helper'

describe "/races/edit.html.erb" do
  include RacesHelper

  before(:each) do
    assigns[:race] = @race = stub_model(Race,
      :new_record? => false,
      :name => "value for name",
      :stage => "value for stage",
      :place => "value for place",
      :distance => "value for distance",
      :url => "value for url"
    )
  end

  it "renders the edit race form" do
    render

    response.should have_tag("form[action=#{race_path(@race)}][method=post]") do
      with_tag('input#race_name[name=?]', "race[name]")
      with_tag('input#race_stage[name=?]', "race[stage]")
      with_tag('input#race_place[name=?]', "race[place]")
      with_tag('input#race_distance[name=?]', "race[distance]")
      with_tag('input#race_url[name=?]', "race[url]")
    end
  end
end
