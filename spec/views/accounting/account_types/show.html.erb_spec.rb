require 'spec_helper'

describe "accounting/account_types/show" do
  before do
    assign(:account_type, Factory(:assets))
  end
  
  it "should show the name of the account type" do
    render
    rendered.should have_content("Name: Assets")
  end
  
  it "should show the code of the account type" do
    render
    rendered.should have_content("Code: assets")
  end
  
  it "should show the name of the account type" do
    render
    rendered.should have_content("Note: Asset Desc")
  end
end
