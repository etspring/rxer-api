# frozen_string_literal: true

module Rxer
  module Api
    module V1
      # Working with /namespace endpoint
      module Namespaces
        def list_namespaces(db_name:)
          get(endpoint: "/api/v1/db/#{db_name}/namespaces")
        end

        def create_namespace(db_name:, namespace:)
          raise ArgumentError "namespace param must be a hash" unless namespace.instance_of?(Hash)

          post(endpoint: "/api/v1/db/#{db_name}/namespaces", payload: namespace)
        end

        def drop_namespace(db_name:, namespace:)
          delete(endpoint: "/api/v1/db/#{db_name}/#{namespace}")
        end

        def truncate_namespace(db_name:, namespace:)
          delete(endpoint: "/api/v1/db/#{db_name}/#{namespace}/truncate")
        end
      end
    end
  end
end
