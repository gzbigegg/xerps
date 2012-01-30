Given /^an account type with name "([^"]*)" and code "([^"]*)"$/ do |name, code|
  account_type = AccountType.new(:name => name, :code => code)
  account_type.save!
end

When /^I submit correct info of an account type$/ do
  fill_in("account_type[name]", :with => "Asset")
  fill_in("account_type[code]", :with => "asset")
  fill_in("account_type[note]", :with => "Asset desc")
  click_button("Submit")
end

When /^I submit incorrect info of an account type$/ do
  # missing name here
  fill_in("account_type[name]", :with => "")
  fill_in("account_type[code]", :with => "asset")
  fill_in("account_type[note]", :with => "Asset desc")
  click_button("Submit")
end

Then /^an new account type was created$/ do
  account_type = AccountType.find_by_name("Asset")
  account_type.code.should eq("asset")
  account_type.note.should eq("Asset desc")
end

Then /^no new account type was created$/ do
  account_type = AccountType.find_by_code("asset")
  account_type.should be_nil
end

Then /^the account type was updated$/ do
  step %{an new account type was created}
  account_type = AccountType.find_by_name("Expense")
  account_type.should be_nil
end

Then /^the account type was not updated$/ do
  step %{no new account type was created}
  account_type = AccountType.find_by_name("Expense")
  account_type.should_not be_nil
end
