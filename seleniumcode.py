
from selenium import webdriver
from PIL import Image
from selenium.webdriver import ActionChains
from selenium.webdriver.common.keys import Keys
import StringIO as strio
import base64

driver = webdriver.Chrome()
driver.get('file:///home/aforrence/Documents/BLAM/fractals/AF_MACHINE.html')

canvas = driver.find_element_by_css_selector("canvas")
actionChains = ActionChains(driver)
actionChains.context_click(canvas).send_keys(Keys.ARROW_DOWN).perform()

# get the canvas as a PNG base64 string
canvas_base64 = driver.execute_script("return arguments[0].toDataURL('image/png').substring(21);", canvas)

# decode
canvas_png = base64.b64decode(canvas_base64)

# save to a file
with open(r"canvas.png", 'wb') as f:
    f.write(canvas_png)

