# frozen_string_literal: true

module Jsonplaceholder
  module Api
    class Response
      include RSpec::Matchers

      attr_reader :response

      def initialize(response)
        @response = response
      end

      def status
        response.status.code
      end

      def body
        response.body
      end

      def verify_status(*statuses)
        expect(statuses).to include(status)
      end

      def verify_json_schema
        # 1. need to store json schemas as fixtures
        # 2. pick one specific for the request
        # 3. compare response schema with one stored as fixture
      end

      def verify_body
        expect(body.empty?).to eq(false)
      end

      def parsed_body
        verify_body
        parse_response
      end

      def safe_parsed_body(status: 200)
        verify_status(status)
        verify_json_schema
        parsed_body
      end

      private

      def parse_response
        result = response.parse
        return parse_hash(result) if result.is_a?(Hash)

        parse_array(result)
      end

      def parse_hash(hsh)
        hsh.transform_keys { |k| str_to_snake_case(k.to_s).to_sym }
           .transform_keys(&:to_sym)
      end

      def parse_array(arr)
        arr.map { |hsh| parse_hash(hsh) }
      end

      def str_to_snake_case(str)
        # usually it's done via ActiveSupport #underscore
        # but it's overkill to pull it into this project
        str.gsub(/(.)([A-Z])/, '\1_\2').downcase
      end
    end
  end
end
