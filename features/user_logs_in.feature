Feature: User logs in to the system

	As a system user
	In order to access protected resources
	I need to log in first
	
	Background: Prepare user account
		Given a user named "yliu" with email "yliu@example.com" and password "go!go!go"
		
	Scenario: Anonymous user is able to see the log in page
		Given I am not logged in
		When I go to the sign in page
		Then I should be on the sign in page
	
	Scenario: Anonymous user can't see the dashboard page
		Given I am not logged in
		When I go to the dashboard page
		Then I should be redirected to the sign in page
	
	Scenario: Registered user successfully signs in with email
		Given I am not logged in
		When I go to the sign in page
		And I sign in with login "yliu@example.com" and password "go!go!go"
		Then I should be on the dashboard page
	
	Scenario: Registered user successfully signs in with username
		Given I am not logged in
		When I go to the sign in page
		And I sign in with login "yliu" and password "go!go!go"
		Then I should be on the dashboard page
	
	Scenario Outline: User failed to sign in
		Given I am not logged in
		When I go to the sign in page
		And I sign in with login "<login>" and password "<password>"
		Then I should still be on the sign in page
		# And I should see message "Invalid Login Or Password"
		
		Scenarios: User email doesn't exist
			| login               | password |
			| noexist@example.com | go!go!go |
		
		Scenarios: Login and password doesn't match
			| login            | password  |
			| yliu@example.com | incorrect |
			| owen@example.com | go!go!go  |
		
		Scenarios: Empty login or password
			| login            | password |
			| yliu@example.com |          |
			|                  | go!go!go |
