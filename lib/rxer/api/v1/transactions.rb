# frozen_string_literal: true

module Rxer
  module Api
    module V1
      # Working with Transactions
      module Transactions
        def create_tx(db_name:, ns_name:)
          post(endpoint: "/api/v1/db/#{db_name}/namespaces/#{ns_name}/transactions/begin", payload: {})
        end

        def commit_tx(db_name:, tx_id:)
          post(endpoint: "/api/v1/db/#{db_name}/transactions/#{tx_id}/commit", payload: {})
        end

        def rollback_tx(db_name:, tx_id:)
          post(endpoint: "/api/v1/db/#{db_name}/transactions/#{tx_id}/rollback", payload: {})
        end

        def create_items_tx(db_name:, tx_id:, payload:)
          post(endpoint: "/api/v1/db/#{db_name}/transactions/#{tx_id}/items", payload: payload)
        end

        def upsert_items_tx(db_name:, tx_id:, payload:)
          patch(endpoint: "/api/v1/db/#{db_name}/transactions/#{tx_id}/items", payload: payload)
        end

        def update_items_tx(db_name:, tx_id:, payload:)
          put(endpoint: "/api/v1/db/#{db_name}/transactions/#{tx_id}/items", payload: payload)
        end

        def drop_items_tx(db_name:, tx_id:, payload:)
          delete(endpoint: "/api/v1/db/#{db_name}/transactions/#{tx_id}/items", payload: payload)
        end
      end
    end
  end
end
