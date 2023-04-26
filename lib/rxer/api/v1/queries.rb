# frozen_string_literal: true

module Rxer
  module Api
    module V1
      # Working with Queries
      module Queries
        def list_db
          get(endpoint: "/api/v1/db")
        end

        def query(db_name:, payload:)
          post(endpoint: "/api/v1/db/#{db_name}/query", payload: { name: db_name })
        end

        def sqlquery(db_name:, payload:)
          post(endpoint: "/api/v1/db/#{db_name}/sqlquery", payload: { name: db_name })
        end
      end
    end
  end
end
