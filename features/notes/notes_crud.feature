@javascript
Feature: Notes CRUD
As a product owner
I want my users to smoothly perform CRUD for note

Background:
	Given I go to the registration page
	When I should fill the form with email "baz@gmail.com" and password "test123"
	   And I click on register
	Then I should see the "Your Notes" in home page

Scenario: User creates a note
	Given I go to the note create page
	When I fill the form with title "Awesome Title" and body "Amazing body of the note"
	   And I click on save
	Then I should see the "Awesome Title" in home page

Scenario: User updates a note
	Given I go to the note create page
		And I fill the form with title "Awesome Title" and body "Amazing body of the note" 
		And I click on save
		And I should see the "Awesome Title" in home page 
	When I go to the edit page for id "1"
		And I fill the form with title "Super Awesome Title" and body "Amazing body of the note" 
		And I click on save
	Then I should see the "Super Awesome Title" in home page	