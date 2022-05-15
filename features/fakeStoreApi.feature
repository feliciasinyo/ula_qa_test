@fake_store_api
Feature: Fake Store API

 Scenario: user add a new product
   When user set request body for add new product
   And user send a "POST" request to "/products"
   Then response code should be "200"
   And response body should be in JSON format
   And response body should contain "id" with value "21"
   And response body should contain "title" with value "sample_product"
   And response body should contain "price" with value "150000.99"
   And response body should contain "description" with value "this is a sample product"
   And response body should contain "image" with value "https://i.pravatar.cc"
   And response body should contain "category" with value "electronic"

 Scenario: user add a new product without request body
   And user send a "POST" request to "/products"
   Then response code should be "200"
   And response body should be in JSON format
   And response body should contain "id" with value "21"

 Scenario: user delete a product
   And user send a "DELETE" request to "/products/6"
   Then response code should be "200"
   And response body should be in JSON format
   And response body should contain "id" with value "6"
   And response body should contain "title" with value "Solid Gold Petite Micropave "
   And response body should contain "price" with value "168"
   And response body should contain "description" with value "Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days."
   And response body should contain "image" with value "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg"
   And response body should contain "category" with value "jewelery"
   And response body should contain "rating.rate" with value "3.9"
   And response body should contain "rating.count" with value "70"

 Scenario: user delete a product with undefined id
   And user send a "DELETE" request to "/products/100"
   Then response code should be "200"
   And response body should be "null"