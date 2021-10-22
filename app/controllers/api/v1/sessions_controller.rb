require 'httparty'
require 'json'

class Api::V1::SessionsController < ApplicationController 
    include HTTParty

    def create 
      url = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=#{session_params[:body]['_json']}" 
      response = HTTParty.get(url)
      @user = User.create_user_for_google(response.parsed_response)
      @user.save
      if @user 
        render json: @user
      else
        render json: { status: 'error', message: 'user could not be created' } 
      end 
    end

    private

    def session_params
      permit(:title, :body)
    end
end