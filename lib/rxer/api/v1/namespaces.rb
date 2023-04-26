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

        def get_namespace(db_name:, namespace:)
          get(endpoint: "/api/v1/db/#{db_name}/namespaces/#{namespace}")
        end

        def drop_namespace(db_name:, namespace:)
          delete(endpoint: "/api/v1/db/#{db_name}/namespaces/#{namespace}")
        end

        def truncate_namespace(db_name:, namespace:)
          delete(endpoint: "/api/v1/db/#{db_name}/#{namespace}/truncate")
        end

        def rename_namespace(db_name:, namespace:, name:)
          get(endpoint: "/api/v1/db/#{db_name}/namespaces/#{namespace}/rename/#{name}")
        end

        def get_namespace_metalist(db_name:, namespace:)
          get(endpoint: "/api/v1/db/#{db_name}/namespaces/#{namespace}/metalist")
        end

        def get_namespace_meta_by_key(db_name:, namespace:, key:)
          get(endpoint: "/api/v1/db/#{db_name}/namespaces/#{namespace}/metabykey/#{key}")
        end

        def update_namespace_meta_key(db_name:, namespace:, payload:)
          put(endpoint: "/api/v1/db/#{db_name}/namespaces/#{namespace}/metabykey", payload: payload)
        end
      end
    end
  end
end
