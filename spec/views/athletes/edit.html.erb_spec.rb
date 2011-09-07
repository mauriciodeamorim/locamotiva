require 'spec_helper'

describe "athletes/edit.html.erb" do
  before(:each) do
    @athlete = assign(:athlete, stub_model(Athlete,
      :name => "MyString",
      :sex => "MyString",
      :birthday => "MyString",
      :cpf => "MyString",
      :phone => "MyString",
      :nick => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit athlete form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => athletes_path(@athlete), :method => "post" do
      assert_select "input#athlete_name", :name => "athlete[name]"
      assert_select "input#athlete_sex", :name => "athlete[sex]"
      assert_select "input#athlete_birthday", :name => "athlete[birthday]"
      assert_select "input#athlete_cpf", :name => "athlete[cpf]"
      assert_select "input#athlete_phone", :name => "athlete[phone]"
      assert_select "input#athlete_nick", :name => "athlete[nick]"
      assert_select "input#athlete_email", :name => "athlete[email]"
    end
  end
end
