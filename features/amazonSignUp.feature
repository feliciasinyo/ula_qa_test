@amazon_sign_up
Feature: Amazon Sign-Up

 Background:
   Given launch amazon sign up page

 Scenario: user sign up with invalid email
   When input all values with invalid email
   When hit create account button
   Then invalid email error message will pop up

 Scenario: user sign up with password not matching
   When input all values with unmatching password
   When hit create account button
   Then password must match error message will pop up