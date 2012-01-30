module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
      
    when /^the sign in page$/
      new_user_session_path
    when /^the dashboard page$/
      root_path
    when /^the add account type page$/
      new_account_type_path
    when /^the account type list page$/
      account_types_path
    when /^the show account type of "([^"]*)" page$/
      account_type = AccountType.find_by_code($1)
      account_type_path(account_type)
    when /^the edit account type of "([^"]*)" page$/
      account_type = AccountType.find_by_code($1)
      edit_account_type_path(account_type)
    end
  end
end

World(NavigationHelpers)
