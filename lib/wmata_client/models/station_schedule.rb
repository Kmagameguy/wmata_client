module WmataClient
  module Models
    class StationSchedule
      WEEKDAYS = %w[ Monday Tuesday Wednesday Thursday Friday Saturday Sunday ]

      def initialize(params={})
        @code = params.fetch("Code")
        @name = params.fetch("StationName")
        @schedule = map_schedule(params)
      end

      # Dynamically defines weekday reader methods,
      # e.g.: station_schedule.on_fridays
      WEEKDAYS.each do |weekday|
        define_method "#{weekday.downcase}" do
          @schedule["on_#{weekday}s"]
        end
      end

      private

      def map_schedule(params)
        (params.keys & WEEKDAYS).each_with_object({}) do |weekday, hash|
          hash[weekday] =
            ::WmataClient::Models::StationWeekday.new(params[weekday])
        end
      end
    end

    class StationWeekday
      attr_reader :opens_at,
                  :first_trains_at,
                  :last_trains_at

      def initialize(params={})
        @opens_at       = params.fetch("OpeningTime")
        @first_trains_at = params.fetch("FirstTrains")
        @last_trains_at  = params.fetch("LastTrains")
      end
    end
  end
end
