require 'payture'

RSpec.describe Payture::API, "#intialize" do
  context "Given a host" do
    it "Initializes the Payture API" do
      @host = "http://www.example.com"
      api = Payture::API.new(@host)
      expect(api.host).to eq @host
    end
  end
end
