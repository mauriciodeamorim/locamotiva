require 'spec_helper'

describe "/athletes/show.html.erb" do
  include AthletesHelper
  before(:each) do
    assigns[:athlete] = @athlete = stub_model(Athlete,
      :name => "value for name",
      :sex => "value for sex",
      :cpf => "value for cpf",
      :phone => "value for phone",
      :nick => "value for nick",
      :email => "value for email"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ sex/)
    response.should have_text(/value\ for\ cpf/)
    response.should have_text(/value\ for\ phone/)
    response.should have_text(/value\ for\ nick/)
    response.should have_text(/value\ for\ email/)
  end
end
