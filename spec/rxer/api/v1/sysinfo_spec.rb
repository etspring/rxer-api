# frozen_string_literal: true

RSpec.describe 'Rxer::Api::V1::Sysinfo' do
  let(:client) { Rxer::Api::Client.new(url: "http://localhost:9088/", version: "v1") }
  %i[check drop_cache allocator_info activity_stats clients_stats mem_stats perf_stats queries_perf_stats
     update_profiling].each do |client_method|
    it "should respond to #{client_method}" do
      expect(client).to respond_to(client_method)
    end
  end
end
