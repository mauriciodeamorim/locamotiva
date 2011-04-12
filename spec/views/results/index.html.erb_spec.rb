require 'spec_helper'

describe "results/index.html.erb" do
  before(:each) do
    assign(:results, [
      stub_model(Result,
        :start_number => "Start Number",
        :category => "Category",
        :team => "Team",
        :class_general => 1,
        :class_sex => 1,
        :class_category => 1,
        :distance => "Distance",
        :substitute => "Substitute",
        :notes => "MyText",
        :race_id => 1,
        :user_id => 1,
        :tshirt => "Tshirt"
      ),
      stub_model(Result,
        :start_number => "Start Number",
        :category => "Category",
        :team => "Team",
        :class_general => 1,
        :class_sex => 1,
        :class_category => 1,
        :distance => "Distance",
        :substitute => "Substitute",
        :notes => "MyText",
        :race_id => 1,
        :user_id => 1,
        :tshirt => "Tshirt"
      )
    ])
  end

  it "renders a list of results" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Start Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Team".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Distance".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Substitute".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tshirt".to_s, :count => 2
  end
end
