Given /^(?:a|another) user named "([^"]*)" with email "([^"]*)" and password "([^"]*)"$/ do |username, email, password|
  @user = User.new(:username => username, :email => email, :password => password)
  @user.save!
end

Given /^user "([^"]*)" has the "([^"]*)" role$/ do |username, role|
  user = User.find_by_username(username)
  if user
    user.admin = true
    user.save!
  end
end

Given /^I am not logged in$/ do
  visit('/users/sign_out')
end

Given /^I am logged in as "([^"]*)" with password "([^"]*)"$/ do |email, password|
  step %{I go to the sign in page}
  step %{I sign in with login "#{email}" and password "#{password}"}
end

When /^I sign in with login "([^"]*)" and password "([^"]*)"$/ do |login, password|
  fill_in("user[login]", :with => login)
  fill_in("user[password]", :with => password)
  click_button("Sign in")
end