require 'payture'
require 'faker'

HOST          = ENV['PAYTURE_HOST']
MERCHANT_ADD  = ENV['PAYTURE_ADD']
PASSWORD      = ENV['PAYTURE_PASSWORD']

@user = {
  login:    Faker::Internet.email         ,
  password: Faker::Internet.password      ,
  phone:    Faker::Number.number(11)
}

DATA_REGISTER = {
  VWUserLgn:    @user[:login]             ,
  VWUserPsw:    @user[:password]
}

DATA_UPDATE = {
  VWUserLgn:    @user[:login]             ,
  VWUserPsw:    @user[:password]          ,
  Phone:        @user[:phone]             ,
}

DATA_DELETE = {
  VWUserLgn:    @user[:login]             ,
  Password:     PASSWORD
}

RSpec.describe Payture::User, "#register" do
  context "Given a merchant and data to register a user" do
    it "should get a response with data" do
      wallet = Payture::User.new(HOST)
      res = wallet.register(MERCHANT_ADD, DATA_REGISTER)
      puts res
      expect(res).not_to be_nil
      expect(res['Register']).not_to be_nil
      expect(res['Register']['VWUserLgn']).not_to be_nil
      expect(res['Register']['Success']).to eq('True')
    end
  end
end

RSpec.describe Payture::User, "#update" do
  context "Given a merchant and data to add a card" do
    it "should get a response with data" do
      wallet = Payture::User.new(HOST)
      res = wallet.update(MERCHANT_ADD, DATA_UPDATE)
      puts res
      expect(res).not_to be_nil
      expect(res['Update']).not_to be_nil
      expect(res['Update']['VWUserLgn']).not_to be_nil
      expect(res['Update']['Success']).to eq('True')
    end
  end
end

RSpec.describe Payture::User, "#check" do
  context "Check the user exists in Payture" do
    it "The user exists in Payture" do
      wallet = Payture::User.new(HOST)
      res = wallet.check(MERCHANT_ADD, DATA_REGISTER)
      puts res
      expect(res).not_to be_nil
      expect(res['Check']).not_to be_nil
      expect(res['Check']['VWUserLgn']).not_to be_nil
      expect(res['Check']['Success']).to eq('True')
    end
  end
end

RSpec.describe Payture::User, "#delete" do
  context "Given a merchant and data to delete a user" do
    it "should get a response with data" do
      wallet = Payture::User.new(HOST)
      res = wallet.delete(MERCHANT_ADD, DATA_DELETE)
      puts res
      expect(res).not_to be_nil
      expect(res['Delete']).not_to be_nil
      expect(res['Delete']['VWUserLgn']).not_to be_nil
      expect(res['Delete']['Success']).to eq('True')
    end
  end
end

RSpec.describe Payture::User, "#check" do
  context "Check the user was deleted from Payture" do
    it "The user is not in Payture" do
      wallet = Payture::User.new(HOST)
      res = wallet.check(MERCHANT_ADD, DATA_REGISTER)
      puts res
      expect(res).not_to be_nil
      expect(res['Check']).not_to be_nil
      expect(res['Check']['VWUserLgn']).not_to be_nil
      expect(res['Check']['Success']).to eq('False')
      expect(res['Check']['ErrCode']).to eq('USER_NOT_FOUND')
    end
  end
end
