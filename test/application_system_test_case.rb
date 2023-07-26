require 'test_helper'

# Gem webdrivers does not work in Chrome version 115
Webdrivers::Chromedriver.required_version = '114.0.5735.90'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
