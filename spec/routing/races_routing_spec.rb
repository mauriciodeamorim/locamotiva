require 'spec_helper'

describe RacesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "admin" }.should route_to(:controller => "admin/races", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "admin/races/new" }.should route_to(:controller => "admin/races", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "admin/races/1" }.should route_to(:controller => "admin/races", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "admin/races/1/edit" }.should route_to(:controller => "admin/races", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "admin/races" }.should route_to(:controller => "admin/races", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "admin/races/1" }.should route_to(:controller => "admin/races", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "admin/races/1" }.should route_to(:controller => "admin/races", :action => "destroy", :id => "1") 
    end
  end
end
