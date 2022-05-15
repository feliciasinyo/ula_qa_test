@shared_driver = Selenium::WebDriver.for :chrome

def get_driver
  @shared_driver
end
