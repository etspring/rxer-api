# frozen_string_literal: true

RSpec.describe 'Rxer::Api::V1::Namespaces' do
  let(:client) { Rxer::Api::Client.new(url: "http://localhost:9088/", version: "v1") }

  %i[list_namespaces create_namespace drop_namespace truncate_namespace].each do |client_method|
    it "should respond to #{client_method}" do
      expect(client).to respond_to(client_method)
    end
  end
end
