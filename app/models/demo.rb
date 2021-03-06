Demo = Struct.new(:url, :keyword) do
  def run
    # headless = Headless.new(dimensions: "1400x960x24", video: { frame_rate: 12, codec: 'libx264', provider: 'ffmpeg' })
    headless = Headless.new(dimensions: "1400x700x24", video: { codec: 'libx264', provider: 'ffmpeg' })

    # headless = Headless.new(dimensions: "1400x900x24")
    headless.start

    headless.video.start_capture

    driver = Selenium::WebDriver.for :chrome
    driver.manage.window.move_to(0, 0)
    driver.manage.window.resize_to(1400, 700)

    driver.navigate.to "https://www.google.com"

    element = driver.find_element(:name, 'q')
    element.send_keys keyword
    # element.submit
    driver.find_element(:class, "lsb").click

    sleep 3
    driver.save_screenshot('/home/ubuntu/projects/RocketQA/public/sample.png')

    #After do |scenario|
    #  if scenario.failed?
        headless.video.stop_and_save("/home/ubuntu/projects/RocketQA/public/sample.mp4")
    #  else
    #    headless.video.stop_and_discard
    #  end
    #end

    headless.destroy
  end
end
