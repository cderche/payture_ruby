require 'payture'
require 'faker'

HOST     = ENV['PAYTURE_HOST']
MERCHANT = ENV['PAYTURE_ADD']
DATA     = {
  OrderId:      Faker::Code.asin          ,
  SessionType:  'Block'                   ,
  VWUserLgn:    Faker::Internet.email     ,
  VWUserPsw:    Faker::Internet.password  ,
  Amount:       '100'                     ,
}

RSpec.describe Payture::Wallet, "#intialize" do
  context "Given a host" do
    it "should initializes the Payture Wallet" do
      wallet = Payture::Wallet.new(HOST)
      expect(wallet.host).to eq HOST
    end
  end
end

RSpec.describe Payture::Wallet, "#init" do
  context "Given a merchant and data" do
    it "should get a response with data" do
      wallet = Payture::Wallet.new(HOST)
      res = wallet.init(MERCHANT, DATA)
      puts res
      expect(res).not_to be_nil
      expect(res['Init']).not_to be_nil
      expect(res['Init']['SessionId']).not_to be_nil
    end
  end
end
