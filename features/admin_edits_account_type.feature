Feature: Admin edits an account type

	As an admin
	In order to manage different account types
	I can edit an account type
	
	Background:
		Given a user named "yliu" with email "yliu@example.com" and password "go!go!go"
		And user "yliu" has the "admin" role
		And another user named "shan" with email "shan@example.com" and password "go!go!go"
		And an account type with name "Expense" and code "expense"
		
	Scenario: Non-admin user failed to access account type management area
		Given I am logged in as "shan@example.com" with password "go!go!go"
		When I go to the edit account type of "expense" page
		Then I should be redirected to the dashboard page
	
	Scenario: Admin user successfully edit an account type
		Given I am logged in as "yliu@example.com" with password "go!go!go"
		When I go to the edit account type of "expense" page
		And I submit correct info of an account type
		Then I should be on the show account type of "asset" page
		And I should see message "Account type was updated successfully"
		And the account type was updated
	
	Scenario: Admin user failed to add account type
		Given I am logged in as "yliu@example.com" with password "go!go!go"
		When I go to the edit account type of "expense" page
		And I submit incorrect info of an account type
		Then I should be on the show account type of "expense" page
		And I should see message "Failed to update account type"
		And the account type was not updated
