class DemoController < ApplicationController
  def create
    url = params[:url]

require 'headless'
headless = Headless.new(dimensions: "1400x900x24", video: { frame_rate: 12, codec: 'libx264', provider: 'ffmpeg' })

# headless = Headless.new(dimensions: "1400x900x24")
puts headless
puts headless.display
puts headless.dimensions
headless.start

#Before do
  headless.video.start_capture
#end

driver = Selenium::WebDriver.for :chrome

driver.navigate.to url
driver.save_screenshot('/home/ubuntu/projects/RocketQA/public/sample.png')
puts driver.title


#After do |scenario|
#  if scenario.failed?
    headless.video.stop_and_save("/home/ubuntu/projects/RocketQA/public/sample.mp4")
#  else
#    headless.video.stop_and_discard
#  end
#end

headless.destroy

    redirect_to root_path
  end
end
