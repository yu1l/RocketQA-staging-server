class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:preorder]

  def index
  end

  def preorder
    preorder = Preorder.new(preorder_params)
    if preorder.save
      render json: { status: 'success', msg: 'Thank you for subscribing ! Our Private Beta is comming soon ! :)' }
    else
      render json: { status: 'error', msg: "email #{preorder.errors.messages[:email][0]}" }
    end
  end

  private

  def preorder_params
    params.require(:preorder).permit(:email)
  end
end
