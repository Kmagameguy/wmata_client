module WmataClient
  module Models
    class RailLine
      def initialize(params={})
        @code = params.fetch("LineCode")
        @name = params.fetch("DisplayName")
        @start_station = params.fetch("StartStationCode")
        @end_station   = params.fetch("EndStationCode")
      end
    end
  end
end
