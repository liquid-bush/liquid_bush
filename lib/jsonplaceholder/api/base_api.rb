# frozen_string_literal: true

module Jsonplaceholder
  module Api
    class BaseApi
      attr_reader :hostname

      def initialize(hostname)
        @hostname = hostname
      end

      def get(path, params = {})
        formatted_params = format_params(params)
        call(:get, path, formatted_params)
      end

      def post(path, params = {})
        call(:post, path, params)
      end

      def put(path, params = {})
        call(:put, path, params)
      end

      def patch(path, params = {})
        call(:patch, path, params)
      end

      def delete(path, params = {})
        call(:delete, path, params)
      end

      private

      def full_path(path)
        hostname + path
      end

      def call(method, path, params)
        url = full_path(path)
        response = HTTP.request(method, url, params)
        Response.new(response)
      end

      def format_params(params)
        return params unless params.key?(:params)

        camelize_query_params(params) # required as API uses camelCase for query params
      end

      def camelize_query_params(params)
        params.tap { |hsh| hsh[:params] = camelize_keys(hsh[:params]) }
      end

      def camelize_keys(hsh)
        hsh.transform_keys { |key| str_to_camel_case_lower(key.to_s).to_sym }
      end

      def str_to_camel_case_lower(str)
        # usually it's done via ActiveSupport #camelize(:lower)
        # but it's overkill to pull it into this project
        str.split("_").reduce([]) { |arr, word| arr << (arr.empty? ? word : word.capitalize) }.join
      end
    end
  end
end
