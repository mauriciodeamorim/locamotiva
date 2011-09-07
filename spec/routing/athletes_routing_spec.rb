require "spec_helper"

describe AthletesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/athletes" }.should route_to(:controller => "athletes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/athletes/new" }.should route_to(:controller => "athletes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/athletes/1" }.should route_to(:controller => "athletes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/athletes/1/edit" }.should route_to(:controller => "athletes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/athletes" }.should route_to(:controller => "athletes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/athletes/1" }.should route_to(:controller => "athletes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/athletes/1" }.should route_to(:controller => "athletes", :action => "destroy", :id => "1")
    end

  end
end
