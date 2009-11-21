require 'spec_helper'

describe "admin/athletes/new.html.erb" do
  include AthletesHelper

  before(:each) do
    assigns[:athlete] = stub_model(Athlete,
      :new_record? => true,
      :name => "value for name",
      :sex => "value for sex",
      :cpf => "value for cpf",
      :phone => "value for phone",
      :nick => "value for nick",
      :email => "value for email"
    )
  end

  it "renders new athlete form" do
    render

    response.should have_tag("form[action=?][method=post]", admin_athletes_path) do
      with_tag("input#athlete_name[name=?]", "athlete[name]")
      with_tag("input#athlete_sex[name=?]", "athlete[sex]")
      with_tag("input#athlete_cpf[name=?]", "athlete[cpf]")
      with_tag("input#athlete_phone[name=?]", "athlete[phone]")
      with_tag("input#athlete_nick[name=?]", "athlete[nick]")
      with_tag("input#athlete_email[name=?]", "athlete[email]")
    end
  end
end
