require 'spec_helper'

describe "athletes/index.html.erb" do
  before(:each) do
    assign(:athletes, [
      stub_model(Athlete,
        :name => "Name",
        :sex => "Sex",
        :birthday => "Birthday",
        :cpf => "Cpf",
        :phone => "Phone",
        :nick => "Nick",
        :email => "Email"
      ),
      stub_model(Athlete,
        :name => "Name",
        :sex => "Sex",
        :birthday => "Birthday",
        :cpf => "Cpf",
        :phone => "Phone",
        :nick => "Nick",
        :email => "Email"
      )
    ])
  end

  it "renders a list of athletes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sex".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Birthday".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nick".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
