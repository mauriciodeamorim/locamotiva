require 'spec_helper'

describe "results/show.html.erb" do
  before(:each) do
    @result = assign(:result, stub_model(Result,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Start Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Category/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Team/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Distance/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Substitute/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tshirt/)
  end
end
