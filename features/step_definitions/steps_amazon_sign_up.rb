driver = get_driver

Given(/^launch amazon sign up page$/) do
  driver.navigate.to('https://www.amazon.com/ap/register?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2F%3F_encoding%3DUTF8%26ref_%3Dnav_newcust&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=usflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&') # direct to site
end

When(/^input all values with invalid email$/) do
  driver.find_element(:id, 'ap_customer_name').send_keys 'Felicia Sinyo'
  driver.find_element(:id, 'ap_email').send_keys 'feliciasinyoo'
  driver.find_element(:id, 'ap_password').send_keys '123456'
  driver.find_element(:id, 'ap_password_check').send_keys '123456'
end

When(/^input all values with unmatching password$/) do
  driver.find_element(:id, 'ap_customer_name').send_keys 'Felicia Sinyo'
  driver.find_element(:id, 'ap_email').send_keys 'feliciasinyoo@gmail.com'
  driver.find_element(:id, 'ap_password').send_keys '123456'
  driver.find_element(:id, 'ap_password_check').send_keys '123457'
end

When(/^hit create account button$/) do
  driver.find_element(:id, 'continue').click
end

Then(/^invalid email error message will pop up$/) do
  error_message = driver.find_element(:id, 'auth-email-invalid-claim-alert').text
  expect(error_message).to eq 'Wrong or Invalid email address or mobile phone number. Please correct and try again.'
end

Then(/^password must match error message will pop up$/) do
  error_message = driver.find_element(:id, 'auth-password-mismatch-alert').text
  expect(error_message).to eq 'Passwords must match'
end
