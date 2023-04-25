# frozen_string_literal: true

module Rxer
  module Api
    module V1
      # Working with /items endpoint
      module Items
        def create_items(db_name:, ns_name:, payload:)
          post(endpoint: "/api/v1/db/#{db_name}/namespaces/#{ns_name}/items", payload: payload)
        end

        def get_items(db_name:, ns_name:, payload: {})
          get(endpoint: "/api/v1/db/#{db_name}/namespaces/#{ns_name}/items", payload: payload)
        end

        def drop_items(db_name:, ns_name:, payload:)
          delete(endpoint: "/api/v1/db/#{db_name}/namespaces/#{ns_name}/items", payload: payload)
        end        
      end
    end
  end
end
