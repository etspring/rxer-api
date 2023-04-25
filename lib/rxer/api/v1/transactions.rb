# frozen_string_literal: true

module Rxer
  module Api
    module V1
      # Working with Transactions
      module Transactions
        def create_items_tx(db_name:, tx_id:, payload:)
          post(endpoint: "/api/v1/db/#{db_name}/transactions/#{tx_id}/items", payload: payload)
        end
      end
    end
  end
end