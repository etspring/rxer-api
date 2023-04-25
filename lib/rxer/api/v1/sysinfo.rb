# frozen_string_literal: true

module Rxer
  module Api
    module V1
      # Working with /db endpoint
      module Sysinfo
        def check
          get(endpoint: "/api/v1/check")
        end

        def drop_cache
          post(endpoint: "/api/v1/allocator/drop_cache", payload: {})
        end

        def allocator_info
          get(endpoint: "/api/v1/allocator/info")
        end

        def activity_stats(db_name:)
          get(endpoint: "/api/v1/db/#{db_name}/namespaces/#activitystats/items")
        end

        def clients_stats(db_name:)
          get(endpoint: "/api/v1/db/#{db_name}/namespaces/#clientsstats/items")
        end

        def mem_stats(db_name:)
          get(endpoint: "/api/v1/db/#{db_name}/namespaces/#memstats/items")
        end

        def perf_stats(db_name:)
          get(endpoint: "/api/v1/db/#{db_name}/namespaces/#perfstats/items")
        end

        def queries_perf_stats(db_name:)
          get(endpoint: "/api/v1/db/#{db_name}/namespaces/#queriesperfstats/items")
        end

        def update_profiling(db_name:, payload:)
          put(endpoint: "/db/#{db_name}/namespaces/#config/items", payload: payload)
        end
      end
    end
  end
end
