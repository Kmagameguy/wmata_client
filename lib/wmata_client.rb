require "json"
require "faraday"
require "dry-struct"
require "active_support/all"

module WmataClient
  autoload :ApiRequest,        "wmata_client/api_request"
  module Models
    autoload :RailLine,        "wmata_client/models/rail_line"
    autoload :Station,         "wmata_client/models/station"
    autoload :StationSchedule, "wmata_client/models/station_schedule"
  end
end