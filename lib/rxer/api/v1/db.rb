# frozen_string_literal: true

module Rxer
  module Api
    module V1
      # Working with /db endpoint
      module Db
        def list_db
          get(endpoint: "/api/v1/db")
        end

        def create_db(db_name:)
          post(endpoint: "/api/v1/db", payload: { name: db_name })
        end

        def drop_db(db_name:)
          delete(endpoint: "/api/v1/db/#{db_name}", payload: { name: db_name })
        end
      end
    end
  end
end
