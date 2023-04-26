# frozen_string_literal: true

module Rxer
  module Api
    module V1
      # Working with schemas
      module Schemas
        def set_schema(db_name:, namespace:, payload:)
          put(endpoint: "/api/v1/db/#{db_name}/namespaces/#{namespace}/schema", payload: payload)
        end

        def get_schema(db_name:, namespace:)
          get(endpoint: "/api/v1/db/#{db_name}/namespaces/#{namespace}/schema")
        end

        def get_protobuf_schema(db_name:)
          get(endpoint: "/api/v1/db/#{db_name}/protobuf_schema")
        end
      end
    end
  end
end
