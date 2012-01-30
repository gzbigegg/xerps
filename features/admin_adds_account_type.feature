Feature: Admin adds account type

	As an admin
	In order to assign account type to a particular account
	I can add an account type
	
	Background:
		Given a user named "yliu" with email "yliu@example.com" and password "go!go!go"
		And user "yliu" has the "admin" role
		And another user named "shan" with email "shan@example.com" and password "go!go!go"
		
	Scenario: Non-admin user failed to access account type management area
		Given I am logged in as "shan@example.com" with password "go!go!go"
		When I go to the add account type page
		Then I should be redirected to the dashboard page
	
	Scenario: Admin user successfully add an account type
		Given I am logged in as "yliu@example.com" with password "go!go!go"
		When I go to the add account type page
		And I submit correct info of an account type
		Then I should be on the account type list page
		And I should see message "Account type was created successfully"
		And an new account type was created
	
	Scenario: Admin user failed to add account type
		Given I am logged in as "yliu@example.com" with password "go!go!go"
		When I go to the add account type page
		And I submit incorrect info of an account type
		Then I should be on the account type list page
		And I should see message "Failed to create account type"
		And no new account type was created
