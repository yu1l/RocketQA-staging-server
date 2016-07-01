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

  def signin
  end

  def teamdomain
    result = RestClient.get 'http://localhost:4000/api/v1/teams/subdomain_check', params: { subdomain: params[:team][:subdomain] }
    render json: result
  end

  private

  def preorder_params
    params.require(:preorder).permit(:email)
  end

  def team_params
    params.require(:team).permit(:subdomain)
  end
end
