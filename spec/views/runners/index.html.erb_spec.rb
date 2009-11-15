require 'spec_helper'

describe "/runners/index.html.erb" do
  include RunnersHelper

  before(:each) do
    assigns[:runners] = [
      stub_model(Runner,
        :name => "value for name",
        :sex => false,
        :cpf => "value for cpf",
        :phone => "value for phone",
        :nick => "value for nick",
        :email => "value for email"
      ),
      stub_model(Runner,
        :name => "value for name",
        :sex => false,
        :cpf => "value for cpf",
        :phone => "value for phone",
        :nick => "value for nick",
        :email => "value for email"
      )
    ]
  end

  it "renders a list of runners" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", "value for cpf".to_s, 2)
    response.should have_tag("tr>td", "value for phone".to_s, 2)
    response.should have_tag("tr>td", "value for nick".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
  end
end
