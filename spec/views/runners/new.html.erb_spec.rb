require 'spec_helper'

describe "/runners/new.html.erb" do
  include RunnersHelper

  before(:each) do
    assigns[:runner] = stub_model(Runner,
      :new_record? => true,
      :name => "value for name",
      :sex => "value for sex",
      :phone => "value for phone",
      :nick => "value for nick",
      :email => "value for email"
    )
  end

  it "renders new runner form" do
    render

    response.should have_tag("form[action=?][method=post]", runners_path) do
      with_tag("input#runner_name[name=?]", "runner[name]")
      with_tag("input#runner_sex[name=?]", "runner[sex]")
      with_tag("input#runner_phone[name=?]", "runner[phone]")
      with_tag("input#runner_nick[name=?]", "runner[nick]")
      with_tag("input#runner_email[name=?]", "runner[email]")
    end
  end
end
