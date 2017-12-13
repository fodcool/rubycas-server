require 'rubygems'
require 'casserver/authenticators/base'
require 'active_record'
require 'httparty'

# 定制的Rails Devise 验证
module CASServer
  module Authenticators
    class RailsDevise < CASServer::Authenticators::Base
      def validate(credentials)
        read_standard_credentials(credentials)

        response = HTTParty.get "http://web.art-bank.net/interface/users/authorize?username=#{@username}&password=#{@password}"
        puts "== response: #{response.inspect}"

        return response.body == 'ok'

        #return true if true
        #return false if @password.blank?
        #@user = User.find_by_email(@username)
        #return false if @user.blank?
        #return @user.valid_password? @password
      end
    end
  end
end
