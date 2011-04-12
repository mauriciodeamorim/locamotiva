require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe ResultsController do

  def mock_result(stubs={})
    @mock_result ||= mock_model(Result, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all results as @results" do
      Result.stub(:all) { [mock_result] }
      get :index
      assigns(:results).should eq([mock_result])
    end
  end

  describe "GET show" do
    it "assigns the requested result as @result" do
      Result.stub(:find).with("37") { mock_result }
      get :show, :id => "37"
      assigns(:result).should be(mock_result)
    end
  end

  describe "GET new" do
    it "assigns a new result as @result" do
      Result.stub(:new) { mock_result }
      get :new
      assigns(:result).should be(mock_result)
    end
  end

  describe "GET edit" do
    it "assigns the requested result as @result" do
      Result.stub(:find).with("37") { mock_result }
      get :edit, :id => "37"
      assigns(:result).should be(mock_result)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created result as @result" do
        Result.stub(:new).with({'these' => 'params'}) { mock_result(:save => true) }
        post :create, :result => {'these' => 'params'}
        assigns(:result).should be(mock_result)
      end

      it "redirects to the created result" do
        Result.stub(:new) { mock_result(:save => true) }
        post :create, :result => {}
        response.should redirect_to(result_url(mock_result))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved result as @result" do
        Result.stub(:new).with({'these' => 'params'}) { mock_result(:save => false) }
        post :create, :result => {'these' => 'params'}
        assigns(:result).should be(mock_result)
      end

      it "re-renders the 'new' template" do
        Result.stub(:new) { mock_result(:save => false) }
        post :create, :result => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested result" do
        Result.stub(:find).with("37") { mock_result }
        mock_result.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :result => {'these' => 'params'}
      end

      it "assigns the requested result as @result" do
        Result.stub(:find) { mock_result(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:result).should be(mock_result)
      end

      it "redirects to the result" do
        Result.stub(:find) { mock_result(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(result_url(mock_result))
      end
    end

    describe "with invalid params" do
      it "assigns the result as @result" do
        Result.stub(:find) { mock_result(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:result).should be(mock_result)
      end

      it "re-renders the 'edit' template" do
        Result.stub(:find) { mock_result(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested result" do
      Result.stub(:find).with("37") { mock_result }
      mock_result.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the results list" do
      Result.stub(:find) { mock_result }
      delete :destroy, :id => "1"
      response.should redirect_to(results_url)
    end
  end

end
