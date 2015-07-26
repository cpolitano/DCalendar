require "net/http"
require "uri"
require "JSON"

class Connection < ActiveRecord::Base

    def get_eventbrite_events
      token = ENV['EVENTBRITE_DCAL_TOKEN']
      baseurl = "https://www.eventbriteapi.com"
      path = "/v3/events/search/?"
      address = URI("#{baseurl}#{path}q=ruby&venue.city=Washington&token=#{token}")
      http = Net::HTTP.new address.host, address.port
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      request = Net::HTTP::Get.new(address.request_uri, initheader = {'Content-Type' =>'application/json'})
      http.start
      response = http.request request
      puts JSON.pretty_generate(JSON.parse(response.body))
      return JSON.parse(response.body)
    end

    def parse_eventbrite_data(data)
      events_array = data["events"]
      return events_array.take(5)
    end

end