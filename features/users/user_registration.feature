@javascript
Feature: User registration
As a product owner
I want my users to smoothly register with the product

Scenario: User registers successfully
	Given I go to the registration page
	When I should fill the form with email "baz@gmail.com" and password "test123"
	   And I click on register
	Then I should see the "Your Notes" in home page


Scenario: User registers fails due to email not provided
	Given I go to the registration page
	When I should fill the form with email "" and password "test123"
	   And I click on register
	Then I should see the "Email can't be blank" in current page