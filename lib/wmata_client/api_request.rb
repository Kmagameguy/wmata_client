# frozen_string_literal: true

module WmataClient
  class ApiRequest
    # API Documentation can be found here:
    # https://developer.wmata.com/apis

    API_BASE_URL = "https://api.wmata.com"

    class << self
      def all_rail_lines
        response = get("Rail.svc/json/jLines")&.dig("Lines") || []
        response.map do |rail_lines_hash|
          ::WmataClient::Models::RailLine.new(rail_lines_hash)
        end
      end
      
      def all_stations
        response = get("Rail.svc/json/jStations")&.dig("Stations") || []
        response.map do |station_hash|
          ::WmataClient::Models::Station.new(station_hash)
        end
      end

      def station_info(station_code:)
        response = get("Rail.svc/json/jStationInfo", { "StationCode" => station_code })
        ::WmataClient::Models::Station.new(response)
      end

      def station_schedule(station_code:)
        response = get("Rail.svc/json/jStationTimes", { "StationCode" => station_code })&.dig("StationTimes") || []
        response.map do |station_schedule_hash|
          ::WmataClient::Models::StationSchedule.new(station_schedule_hash)
        end
      end

      private

      def get(path, opts={})
        response = connection.get("#{API_BASE_URL}/#{path}", opts)
        response&.body
      end

      def connection
        Faraday::Connection.new do |f|
          f.adapter Faraday.default_adapter
          f.request :json
          f.response :json
          f.headers["api_key"] = api_key
          f.headers["Content-Type"] = "application/json"
          f.headers["Accept"] = "application/json"
        end
      end

      def api_key
        ENV.fetch("WMATA_API_KEY")
      end
    end
  end
end
