require 'spec_helper'

describe "/runners/show.html.erb" do
  include RunnersHelper
  before(:each) do
    assigns[:runner] = @runner = stub_model(Runner,
      :name => "value for name",
      :sex => false,
      :cpf => "value for cpf",
      :phone => "value for phone",
      :nick => "value for nick",
      :email => "value for email"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/false/)
    response.should have_text(/value\ for\ cpf/)
    response.should have_text(/value\ for\ phone/)
    response.should have_text(/value\ for\ nick/)
    response.should have_text(/value\ for\ email/)
  end
end
