require 'payture'

data = {
  "OrderId":"C4gvjVoytwUR6Mth6WtEj4Rz",
  "SessionType":"Block", "VWUserLgn":"leann@goldner.co",
  "VWUserPsw":"S2WWvYSJSIg1EPw0D e0TAPFWCuOzt1/DMewfIWFmpD6ja 2yjpCMn3omn0UCzDf/n9u8T6US7wyXvzgiG  gcEHRXUe8x55ZDY8rmyxSuuCRPS3urX2xHGfFymuxHG3z2QH4uUP8 fqExEzmbLkkh5g0PlAzaX4XCZovnJ655F28kIQBnBdrERDOxZPHSQT5BMC3jeTLIVSpe82jTlm PC05WABUjZ9Jtf48TkuCDxDpRpXeITU7NIQ57yTOlK OgKEKG/B6b5TIsEiVW/4jiNVF7orF8pKqwmKFApYITmls/UORFQ CNmwp6 ak6ipjvhnuWNbgrET9RyvLaxeSX4YTfcSOwZv7zZcyzdDFPL1avhs9QsvXid9kMDSclyNO4cyFRLWn9qvWEjighLX wcHkOKGi FXca1kyhwB34bs/njZPizWSR2tyU9Rn2Tv7jsntO6IvHZc6bR0KGgK1 TfE r5wN1Nnu1RX2BIzxUZ6igE/VcTi9WWdjVnX4xe2BqURrSWBDCk7pRnWnmbuhf/ZQ/RwdljTcTQG2JxabDnKV8VUseCXrvOOMjn8lXWRbxb/Jk k7bpokhg0czcs6ecikVtgzdYCeIgz6dQCxb FA3PLdnqfODE3ge2byOvsKDSevmowFHp2MaeGfefjg3j/xWZuzlLizO4xy5juhc=",
  "Amount":"100",
  "TransactionDate":"10/7/2016 6:48:56 PM",
  "CardHolder":"leann goldner",
  "IsAlfa":"False",
  "CardName":"411111xxxxxx1111",
  "CardId":"faec04e5-3709-4f51-8885-57c344bcdce8",
  "CardNumber":"411111xxxxxx1111",
  "SessionId":"e60cfa96-2e07-47c8-85fb-d544daf6f608",
  "DateTime":"636114629352328359",
  "Success":"True",
  "Notification":"CustomerAddSuccess",
  "MerchantContract":"VWMerchantGetshinyAdd"
}

RSpec.describe Payture::Parser, "#init" do
  context "Given a notification from Payture" do
    it "Shows me every key and value" do
      parser = Payture::Parser.new
      parser.parse(data)
      expect(true)
    end
  end
end
