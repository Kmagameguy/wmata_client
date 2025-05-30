module WmataClient
  module Models
    class Station
      class ApiError < StandardError; end

      attr_reader :code,
                  :name,
                  :latitude,
                  :longitude,
                  :street,
                  :city,
                  :state,
                  :zip_code,
                  :first_line_code,
                  :second_line_code,
                  :third_line_code,
                  :fourth_line_code

      def initialize(params={})
        @code      = params.fetch("Code")
        @name      = params.fetch("Name")
        @latitude  = params.fetch("Lat")
        @longitude = params.fetch("Lon")
        @street    = params.fetch("Address").fetch("Street")
        @city      = params.fetch("Address").fetch("City")
        @state     = params.fetch("Address").fetch("State")
        @zip_code  = params.fetch("Address").fetch("Zip")
        @first_line_code  = params.dig("LineCode1").presence
        @second_line_code = params.dig("LineCode2").presence
        @third_line_code  = params.dig("LineCode3").presence
        @fourth_line_code = params.dig("LineCode4").presence
      end

      def address
        "#{street}, #{city}, #{state} #{zip_code}"
      end

      def line_codes
        [ first_line_code, second_line_code, third_line_code, fourth_line_code ]
      end
    end
  end
end