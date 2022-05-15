@amazon_sign_in
Feature: Amazon Sign-In

 Background:
   Given launch amazon sign in page

 Scenario: User Sign In with unregistered email
   When input unregistered email and click continue
   Then error message will pop up "There was a problem"

 Scenario: User Sign In with wrong password
   When input email and click continue
   When input incorrect password and click sign in
   Then error message will pop up "Your password is incorrect"

