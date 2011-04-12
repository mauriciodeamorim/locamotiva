require 'spec_helper'

describe "results/new.html.erb" do
  before(:each) do
    assign(:result, stub_model(Result,
      :start_number => "MyString",
      :category => "MyString",
      :team => "MyString",
      :class_general => 1,
      :class_sex => 1,
      :class_category => 1,
      :distance => "MyString",
      :substitute => "MyString",
      :notes => "MyText",
      :race_id => 1,
      :user_id => 1,
      :tshirt => "MyString"
    ).as_new_record)
  end

  it "renders new result form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => results_path, :method => "post" do
      assert_select "input#result_start_number", :name => "result[start_number]"
      assert_select "input#result_category", :name => "result[category]"
      assert_select "input#result_team", :name => "result[team]"
      assert_select "input#result_class_general", :name => "result[class_general]"
      assert_select "input#result_class_sex", :name => "result[class_sex]"
      assert_select "input#result_class_category", :name => "result[class_category]"
      assert_select "input#result_distance", :name => "result[distance]"
      assert_select "input#result_substitute", :name => "result[substitute]"
      assert_select "textarea#result_notes", :name => "result[notes]"
      assert_select "input#result_race_id", :name => "result[race_id]"
      assert_select "input#result_user_id", :name => "result[user_id]"
      assert_select "input#result_tshirt", :name => "result[tshirt]"
    end
  end
end
