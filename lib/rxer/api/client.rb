# frozen_string_literal: true

module Rxer
  module Api
    # HTTP-client based on Faraday and Excon adapter
    class Client
      attr_reader :api_version
      attr_accessor :conn

      def initialize(url:, version: "v1")
        @api_version = version
        @conn = Faraday.new(url: url) do |f|
          f.adapter :excon, persistent: true
          f.request :json
          f.response :json
        end
        include_api_version_methods
      end

      private

      # Вычислить путь звезды, и развести сады,
      # И укротить тайфун - всё может магия...
      def include_api_version_methods
        Dir.glob("#{__dir__}/#{api_version}/*.rb").sort.each do |endpoint|
          require endpoint
          mdl_to_incl = "Rxer::Api::#{api_version.capitalize}::#{endpoint.split("/").last.gsub(".rb", "").capitalize}"
          self.class.send(:include, Object.const_get(mdl_to_incl))
        end
      end

      %w[post put patch].each do |method_name|
        define_method(method_name) do |endpoint:, payload: {}|
          conn.send(method_name, endpoint) do |req|
            req.body = payload
          end
        end
      end

      %w[get delete].each do |method_name|
        define_method(method_name) do |endpoint:, payload: {}|
          conn.send(method_name, endpoint, payload)
        end
      end
    end
  end
end
