require 'spec_helper'

describe "account_types/edit" do
  let (:account_type) {
    mock_model("AccountType").as_null_object
  }
  
  before(:each) do
    assign(:account_type, account_type)
  end
  
  it "should render a form to create an account type" do
    render
    Capybara.string(rendered).find("form[method=post][action='#{account_type_path(account_type)}']").tap do |form|
      form.should have_selector("input[type=submit]")
    end
  end
  
  it "should render a text field for account type name inside the form" do
    render
    Capybara.string(rendered).find("form[method=post][action='#{account_type_path(account_type)}']").tap do |form|
      form.should have_selector("input[type=text][name='account_type[name]']")
    end
  end
  
  it "should render a text field for account type code inside the form" do
    render
    Capybara.string(rendered).find("form[method=post][action='#{account_type_path(account_type)}']").tap do |form|
      form.should have_selector("input[type=text][name='account_type[code]']")
    end
  end
  
  it "should render a text field for account type close_method inside the form" do
    render
    Capybara.string(rendered).find("form[method=post][action='#{account_type_path(account_type)}']").tap do |form|
      form.should have_selector("input[type=text][name='account_type[close_method]']")
    end
  end
  
  it "should render a text field for account type report_type inside the form" do
    render
    Capybara.string(rendered).find("form[method=post][action='#{account_type_path(account_type)}']").tap do |form|
      form.should have_selector("input[type=text][name='account_type[report_type]']")
    end
  end
  
  it "should render a text area for account type note inside the form" do
    render
    Capybara.string(rendered).find("form[method=post][action='#{account_type_path(account_type)}']").tap do |form|
      form.should have_selector("textarea[name='account_type[note]']")
    end
  end
end
