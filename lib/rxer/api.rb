# frozen_string_literal: true

require "faraday"
require "faraday/excon"
require_relative "api/version"
require_relative "api/client"

module Rxer
  module Api
    class Error < StandardError; end
  end
end
