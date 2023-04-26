# frozen_string_literal: true

RSpec.describe 'Rxer::Api::V1::Items' do
  let(:client) { Rxer::Api::Client.new(url: "http://localhost:9088/", version: "v1") }
  %i[drop_items create_items update_items get_items upsert_items].each do |client_method|
    it "should respond to #{client_method}" do
      expect(client).to respond_to(client_method)
    end
  end
end
