
from selenium import webdriver
from selenium.webdriver import ActionChains

driver = webdriver.Firefox()
driver.get('file:///home/aforrence/Documents/BLAM/fractals/AF_MACHINE.html')
driver.set_window_size(600, 671)

actionChains = ActionChains(driver)
actionChains.send_keys("h").perform()
driver.save_screenshot('test.png')

driver.close()

