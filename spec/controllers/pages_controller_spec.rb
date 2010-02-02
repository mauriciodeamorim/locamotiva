require 'spec_helper'

describe PagesController do
  describe "handling Show" do
    
    def do_get(id=nil)
      get :show, :id => id || 'about'
    end
    
    it "should handler the about template to about page" do
      do_get
      response.should render_template('pages/show/about')
    end
    
    it "should render 404 for unkown templates" do
      pending
      do_get("all_unknow_pages")
      response.should_not be_success
    end
  end
end
