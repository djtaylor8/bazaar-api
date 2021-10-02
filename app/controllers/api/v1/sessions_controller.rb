require 'httparty'
require 'json'

class Api::V1::SessionsController < ApplicationController 
    include HTTParty

    skip_before_action :authenticate

    def create 
      url = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=#{params['_json']}"     
      response = HTTParty.get(url)
      @user = User.create_user_for_google(response.parsed_response)
      @user.save 
      render json: @user              
    end
end