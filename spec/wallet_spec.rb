require 'payture'
require 'faker'

HOST          = ENV['PAYTURE_HOST']
MERCHANT_ADD  = ENV['PAYTURE_ADD']
MERCHANT_PAY  = ENV['PAYTURE_PAY']
USER_LGN      = ENV['USER_LGN']
USER_PWD      = ENV['USER_PWD']
USER_CARD     = ENV['USER_CARD']

@user = {
  login:    Faker::Internet.email         ,
  password: Faker::Internet.password
}

DATA_INIT = {
  OrderId:      SecureRandom.hex          ,
  SessionType:  'Block'                   ,
  VWUserLgn:    @user[:login]             ,
  VWUserPsw:    @user[:password]          ,
  Amount:       100                       ,
}

DATA_PAY = {
  OrderId:      SecureRandom.hex          ,
  VWUserLgn:    USER_LGN                  ,
  VWUserPsw:    USER_PWD                  ,
  Amount:       100                       ,
  CardId:       USER_CARD
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
  context "Given a merchant and data to create a session" do
    it "should get a response with data" do
      wallet = Payture::Wallet.new(HOST)
      res = wallet.init(MERCHANT_ADD, DATA_INIT)
      puts res
      expect(res).not_to be_nil
      expect(res['Init']).not_to be_nil
      expect(res['Init']['SessionId']).not_to be_nil
    end
  end
end

RSpec.describe Payture::Wallet, "#pay" do
  context "Given a user exist and has a card" do
    it "should get a response with data" do
      wallet = Payture::Wallet.new(HOST)
      res = wallet.pay(MERCHANT_PAY, DATA_PAY)
      puts res
      expect(res).not_to be_nil
      expect(res['Pay']).not_to be_nil
      expect(res['Pay']['Success']).to eq('True')
      # expect(res['Pay']['Success']).to eq('True')
    end
  end
end
