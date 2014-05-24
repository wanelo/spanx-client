require 'spanx/client/version'
require "uri"
require 'net/http'
require 'json'

module Spanx
  class Client
    def self.url=(url)
      @url = url
    end

    def self.url
      @url || "http://localhost:6060"
    end

    def self.configure
      yield self
    end

    def self.blocked_ips
      response = request "/ips/blocked" do |uri|
        Net::HTTP::Get.new(uri.request_uri)
      end

      JSON.parse(response.body)
    end

    def self.unblock(ip)
      request "/ips/blocked/#{ip}" do |uri|
        Net::HTTP::Delete.new(uri.request_uri)
      end
    end

    private

    def self.request(path)
      uri = URI.parse(url + path)

      http = Net::HTTP.new(uri.host, uri.port)
      request = yield uri

      http.request(request)
    end
  end
end
