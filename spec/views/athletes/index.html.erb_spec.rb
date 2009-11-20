require 'spec_helper'

describe "/athletes/index.html.erb" do
  include AthletesHelper

  before(:each) do
    assigns[:athletes] = [
      stub_model(Athlete,
        :name => "value for name",
        :sex => "value for sex",
        :cpf => "value for cpf",
        :phone => "value for phone",
        :nick => "value for nick",
        :email => "value for email"
      ),
      stub_model(Athlete,
        :name => "value for name",
        :sex => "value for sex",
        :cpf => "value for cpf",
        :phone => "value for phone",
        :nick => "value for nick",
        :email => "value for email"
      )
    ]
  end

  it "renders a list of athletes" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for sex".to_s, 2)
    response.should have_tag("tr>td", "value for cpf".to_s, 2)
    response.should have_tag("tr>td", "value for phone".to_s, 2)
    response.should have_tag("tr>td", "value for nick".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
  end
end
