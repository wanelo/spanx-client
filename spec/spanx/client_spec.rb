require 'spec_helper'
require 'spanx/client'

describe Spanx::Client do
  describe '#configure' do
    it 'allows configuration of the url' do
      expect(Spanx::Client.url).to eq("http://localhost:6060")

      Spanx::Client.configure do |c|
        c.url = "http://localhost:2302"
      end

      expect(Spanx::Client.url).to eq("http://localhost:2302")

      Spanx::Client.url = nil
    end
  end

  describe '.blocked_ips' do
    it 'returns an array of blocked ips from spanx' do
      stub_request(:get, "http://localhost:6060/ips/blocked").
        to_return(:status => 200, :body => '["127.0.0.1","192.168.1.1"]', :headers => {})

      expect(Spanx::Client.blocked_ips).to eq(["127.0.0.1", "192.168.1.1"])
    end
  end
  
  describe '.unblock' do
    it 'makes a request to unblock the ip' do
      request = stub_request(:delete, "http://localhost:6060/ips/blocked/192.168.1.1").
        to_return(:status => 204, :body => '', :headers => {})

      Spanx::Client.unblock('192.168.1.1')

      request.should have_been_requested
    end
  end
end
