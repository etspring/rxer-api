# frozen_string_literal: true

RSpec.describe 'Rxer::Api::V1::Db' do
  let(:client) { Rxer::Api::Client.new(url: "http://localhost:9088/", version: "v1") }
  %i[list_db create_db drop_db].each do |client_method|
    it "should respond to #{client_method}" do
      expect(client).to respond_to(client_method)
    end
  end
end
