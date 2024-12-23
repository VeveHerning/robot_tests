import time
from appium import webdriver
from appium.webdriver.common.by import By

# Desired capabilities
desired_caps = {
    'platformName': 'Android',
    'platformVersion': '11.0',
    'deviceName': 'Android Emulator',
    'app': '/path/to/your/app.apk',
    'automationName': 'UiAutomator2'
}

# Start the Appium driver
driver = webdriver.Remote('http://localhost:4724/wd/hub', desired_caps)

try:
    # Wait for the app to load
    time.sleep(5)

    # Example: Find an element and perform an action
    element = driver.find_element(By.ID, 'com.example:id/button')
    element.click()

    # Additional actions can be added here

finally:
    # Quit the driver
    driver.quit()
