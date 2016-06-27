class DemoController < ApplicationController
  def create
    url = params[:url]
    keyword = params[:keyword]
    return redirect_to root_path unless url == 'google'

    require 'headless'
    headless = Headless.new(dimensions: "1400x900x24", video: { frame_rate: 12, codec: 'libx264', provider: 'ffmpeg' })

    # headless = Headless.new(dimensions: "1400x900x24")
    headless.start

    headless.video.start_capture

    driver = Selenium::WebDriver.for :chrome

    driver.navigate.to "https://www.google.com"

    element = driver.find_element(:name, 'q')
    element.send_keys(keyword || "Hello RocketQA")
    # element.submit
    driver.find_element(:class, "lsb").click

    driver.save_screenshot('/home/ubuntu/projects/RocketQA/public/sample.png')

    #After do |scenario|
    #  if scenario.failed?
        headless.video.stop_and_save("/home/ubuntu/projects/RocketQA/public/sample.mp4")
    #  else
    #    headless.video.stop_and_discard
    #  end
    #end

    headless.destroy

    redirect_to root_path
  rescue
    redirect_to root_path
  end
end
