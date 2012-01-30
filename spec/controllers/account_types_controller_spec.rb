require 'spec_helper'

describe AccountTypesController do
  login_admin
  
  let(:valid_attributes) {
    { "name" => "name", "code" => "001", "note" => "desc" }
  }
  
  describe "GET new" do
    before do
      get :new
    end
    
    it { should assign_to(:account_type) }
    it { should respond_with(:success) }
    it { should render_template(:new) }
  end
  
  describe "POST create" do
    let(:account_type) {
      mock_model("AccountType").as_new_record.as_null_object
    }
    
    before do
      AccountType.should_receive(:new).with(valid_attributes).and_return(account_type)
    end
    
    it "should create an account type object" do
      post :create, :account_type => valid_attributes
    end
    
    it "should save the account type object" do
      account_type.should_receive(:save)
      post :create, :account_type => valid_attributes
    end
    
    context "when save succeeded" do
      before(:each) do
        account_type.should_receive(:save).and_return(true)
      end
      
      it "should set a flash message to indicate the successful creation" do
        post :create, :account_type => valid_attributes
        flash[:notice].should eq("Account type was created successfully")
      end
      
      it "should redirect to the account type list page" do
        post :create, :account_type => valid_attributes
        response.should redirect_to(account_types_path)
      end
    end
    
    context "when save failed" do
      before(:each) do
        account_type.should_receive(:save).and_return(false)
      end
      
      it "should set a flash message to indicate creation failed" do
        post :create, :account_type => valid_attributes
        flash[:error].should eq("Failed to create account type")
      end
      
      it "should stay at the new account type page" do
        post :create, :account_type => valid_attributes
        response.should render_template("new")
      end
    end
  end
  
  describe "PUT update" do
    let(:account_type) {
      mock_model("AccountType").as_null_object
    }
    
    before do
      AccountType.should_receive(:find).with("1").and_return(account_type)
    end
    
    it "should load the specified account type" do
      put :update, :id => "1", :account_type => valid_attributes
    end
    
    it "should update the account type attributes" do
      account_type.should_receive(:update_attributes).with(valid_attributes)
      put :update, :id => "1", :account_type => valid_attributes
    end
    
    context "when update succeeded" do
      before do
        account_type.should_receive(:update_attributes).and_return(true)
      end
      
      it "should set a flash message to indicate the update was successful" do
        put :update, :id => "1", :account_type => valid_attributes
        flash[:notice].should eq("Account type was updated successfully")
      end
      
      it "should redirect to the show account type page" do
        put :update, :id => "1", :account_type => valid_attributes
        response.should redirect_to(account_type_path(account_type))
      end
    end
    
    context "when update failed" do
      before do
        account_type.should_receive(:update_attributes).and_return(false)
      end
      
      it "should set a flash message to indicate the update was failed" do
        put :update, :id => "1", :account_type => valid_attributes
        flash[:error].should eq("Failed to update account type")
      end
      
      it "should remain at the account type edit page" do
        put :update, :id => "1", :account_type => valid_attributes
        response.should render_template("edit")
      end
    end
  end
  
  describe "GET show" do
    before do
      AccountType.should_receive(:find).with("1").and_return(mock_model("AccountType"))
      get :show, :id => 1
    end
    
    it { should assign_to(:account_type) }
    it { should respond_with(:success) }
    it { should render_template(:show) }
  end
end
