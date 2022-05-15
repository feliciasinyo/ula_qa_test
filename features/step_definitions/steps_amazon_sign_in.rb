driver = get_driver

Given(/^launch amazon sign in page$/) do
  driver.navigate.to('https://www.amazon.com/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2F%3F_encoding%3DUTF8%26adgrpid%3D82342659060%26gclid%3DEAIaIQobChMIoK7ihOHg9wIVu5hmAh3_hQnEEAAYASAAEgLFTfD_BwE%26hvadid%3D585475370855%26hvdev%3Dc%26hvdvcmdl%3D%26hvlocint%3D%26hvlocphy%3D1007716%26hvnetw%3Dg%26hvpone%3D%26hvpos%3D%26hvptwo%3D%26hvqmt%3De%26hvrand%3D4271935457619794350%26hvtargid%3Dkwd-10573980%26hydadcr%3D2246_13468515%26ref%3Dpd_sl_7nnedyywlk_e%26tag%3Dgoogleglobalp-20%26ref_%3Dnav_custrec_newcust&prevRID=0VD6BTNQKE8MEK7SV5C8&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=usflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&pageId=usflex&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0')
end

When(/^input unregistered email and click continue$/) do
  driver.find_element(:id, 'ap_email').send_keys 'auifewiufhauiwoe@gmail.com'
  driver.find_element(:id, 'continue').click
end

When(/^input email and click continue$/) do
  driver.find_element(:id, 'ap_email').send_keys 'feliciasinyoo@gmail.com'
  driver.find_element(:id, 'continue').click
end

When(/^input incorrect password and click sign in$/) do
  driver.find_element(:id, 'ap_password').send_keys '123456'
  driver.find_element(:id, 'signInSubmit').click
end

Then(/^error message will pop up "([^"]*)"$/) do |expected_error|
  error_message = driver.find_element(:id, 'auth-error-message-box').text
  expect(error_message).to include expected_error
end
