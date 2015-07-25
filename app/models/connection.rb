require "net/http"
require "uri"
require "JSON"

class Connection < ActiveRecord::Base

    def get_eventbrite_events
      token = ENV['EVENTBRITE_DCAL_TOKEN']
      baseurl = "https://www.eventbriteapi.com"
      path = "/v3/events/search/?"
      # search_term = URI.encode_www_form("q" => "#{keyword}")
      address = URI("#{baseurl}#{path}q=ruby%20rails&token=#{token}")
      http = Net::HTTP.new address.host, address.port
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      request = Net::HTTP::Get.new(address.request_uri, initheader = {'Content-Type' =>'application/json'})
      http.start
      response = http.request request
      JSON.parse(response.body)
    end

end