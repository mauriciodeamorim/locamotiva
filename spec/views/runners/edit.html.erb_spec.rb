require 'spec_helper'

describe "/runners/edit.html.erb" do
  include RunnersHelper

  before(:each) do
    assigns[:runner] = @runner = stub_model(Runner,
      :new_record? => false,
      :name => "value for name",
      :sex => false,
      :cpf => "value for cpf",
      :phone => "value for phone",
      :nick => "value for nick",
      :email => "value for email"
    )
  end

  it "renders the edit runner form" do
    render

    response.should have_tag("form[action=#{runner_path(@runner)}][method=post]") do
      with_tag('input#runner_name[name=?]', "runner[name]")
      with_tag('input#runner_sex[name=?]', "runner[sex]")
      with_tag('input#runner_cpf[name=?]', "runner[cpf]")
      with_tag('input#runner_phone[name=?]', "runner[phone]")
      with_tag('input#runner_nick[name=?]', "runner[nick]")
      with_tag('input#runner_email[name=?]', "runner[email]")
    end
  end
end
