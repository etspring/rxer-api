# frozen_string_literal: true

module Rxer
  module Api
    module V1
      # Working with Indexes
      module Indexes
        def list_indexes(db_name:, ns_name:)
          get(endpoint: "/api/v1/db/#{db_name}/namespaces/#{ns_name}/idexes")
        end

        def create_index(db_name:, ns_name:, payload:)
          post(endpoint: "/api/v1/db/#{db_name}/namespaces/#{ns_name}/indexes", payload: payload)
        end

        def update_index(db_name:, ns_name:, payload:)
          put(endpoint: "/api/v1/db/#{db_name}/namespaces/#{ns_name}/indexes", payload: payload)
        end

        def drop_index(db_name:, ns_name:, index:)
          delete(endpoint: "/api/v1/db/#{db_name}/namespaces/#{ns_name}/idexes/#{index}")
        end
      end
    end
  end
end
