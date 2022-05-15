When(/^user set request body for add new product$/) do
  @request_body = {
    'title' => 'sample_product',
    'price' => 150_000.99,
    'description' => 'this is a sample product',
    'image' => 'https://i.pravatar.cc',
    'category' => 'electronic'
  }
end

When(/^user send a "(.*)" request to "(.*)"$/) do |method, path|
  @base_url = 'https://fakestoreapi.com'
  @request_response = RestClient::Request.execute(
    method: method.to_sym,
    url: @base_url + path,
    payload: @request_body
  )
end

Then(/^response code should be "(.*)"$/) do |expected_status_code|
  expect(@request_response.code.to_s).to eq expected_status_code
end

Then(/^response body should be in JSON format$/) do
  @response_body = JSON.parse(@request_response.body)
end

Then(/^response body should be "(.*)"$/) do |expected_response|
  expect(@request_response.body).to eq expected_response
end

Then(/^response body should contain "(.*)" with value "(.*)"$/) do |key, expected_value|
  actual_value = @response_body
  key.split('.').each { |k| actual_value = actual_value[k] }
  expect(actual_value.to_s).to eq expected_value
end
