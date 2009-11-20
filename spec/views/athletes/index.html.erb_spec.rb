require 'spec_helper'

describe "/athletes/index.html.erb" do
  include AthletesHelper

  it "renders a restrict page" do
    render
    response.should have_tag("h1", "Área restrita")
    response.should include_text("restrita")
  end
end
