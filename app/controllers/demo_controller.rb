class DemoController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    url = params[:demo][:url]
    return render nothing: true, status: 500 unless url == 'google'

    keyword = params[:demo][:keyword]
    keyword = "Hello RocketQA" if keyword == ""
    demo = Demo.new(url, keyword)
    puts demo.nil?
    begin
    demo.run
    rescue
      return render json: { status: 'error' }
    end
    render json: { status: 'success' }
  end
end
