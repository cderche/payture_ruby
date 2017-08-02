require 'payture'

HOST          = ENV['PAYTURE_HOST']
MERCHANT_ADD  = ENV['PAYTURE_ADD']
USER_LGN      = ENV['USER_LGN']
USER_PWD      = ENV['USER_PWD']

DATA_LIST = {
  VWUserLgn:    USER_LGN,
  VWUserPsw:    USER_PWD
}

RSpec.describe Payture::Card, "#list" do
  context "Given a merchant and data" do
    it "should get a response with data" do
      wallet = Payture::Card.new(HOST)
      res = wallet.list(MERCHANT_ADD, DATA_LIST)
      puts res
      expect(res).not_to be_nil
      expect(res['GetList']).not_to be_nil
      expect(res['GetList']['VWUserLgn']).not_to be_nil
      expect(res['GetList']['Success']).to eq('True')
      expect(res['GetList']['Item']).not_to be_nil
    end
  end
end
