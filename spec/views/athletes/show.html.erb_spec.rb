require 'spec_helper'

describe "athletes/show.html.erb" do
  before(:each) do
    @athlete = assign(:athlete, stub_model(Athlete,
      :name => "Name",
      :sex => "Sex",
      :birthday => "Birthday",
      :cpf => "Cpf",
      :phone => "Phone",
      :nick => "Nick",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sex/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Birthday/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Cpf/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nick/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
  end
end
