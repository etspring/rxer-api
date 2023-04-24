# frozen_string_literal: true

RSpec.describe Rxer::Api::Client do
  let(:client) { described_class.new(url: "http://localhost:9088/") }
  it "url: param required" do
    expect { described_class.new }.to raise_error ArgumentError
  end

  it "has default (v1) api_version" do
    expect(client.api_version).to eq("v1")
  end

  describe "Faraday" do
    it "is Faraday::Connection" do
      expect(client.conn).is_a? Faraday::Connection
    end

    it "has Faraday::Adapter::Excon adapter" do
      expect(client.conn.adapter).is_a? Faraday::Adapter::Excon
    end

    it "has url specified at url param" do
      expect(client.conn.url_prefix.to_s).to eq("http://localhost:9088/")
    end

    describe "HTTP Core methods" do
      before do
        %i[get post delete put patch].each do |http_method|
          stub_request(http_method, "http://localhost:9088/test").with(body: {}).to_return(status: 200, body: "")
        end
      end

      %w[get delete post patch put].each do |http_method|
        it "has core HTTP #{http_method.upcase}" do
          expect(client.send(http_method, endpoint: "/test", payload: {})).is_a? Faraday::Response
        end
      end
    end
  end
end
