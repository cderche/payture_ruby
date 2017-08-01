# require 'payture'
# require 'faker'
#
# HOST          = ENV['PAYTURE_HOST']
# MERCHANT_ADD  = ENV['PAYTURE_ADD']
# PASSWORD      = ENV['PAYTURE_PASSWORD']
#
# @user = {
#   login:    Faker::Internet.email         ,
#   password: Faker::Internet.password      ,
#   phone:    Faker::Number.number(11)
# }
#
# DATA_ADD = {
#   VWUserLgn:    @user[:login]             ,
#   VWUserPsw:    @user[:password]          ,
#   CardNumber:   4111111111111112          ,
#   EMonth:       8                         ,
#   EYear:        18                        ,
#   CardHolder:   'John Doe'                ,
#   SecureCode:   123
# }
#
# DATA_DELETE = {
#   VWUserLgn:    @user[:login]             ,
#   Password:     PASSWORD
# }
#
# RSpec.describe Payture::User, "#add" do
#   context "Given a merchant and data to register a user" do
#     it "should get a response with data" do
#       wallet = Payture::Card.new(HOST)
#       res = wallet.add(MERCHANT_ADD, DATA_ADD)
#       puts res
#       expect(res).not_to be_nil
#       expect(res['Add']).not_to be_nil
#       expect(res['Add']['VWUserLgn']).not_to be_nil
#       expect(res['Add']['Success']).to eq('True')
#
#       user = Payture::User.new(HOST)
#       user.delete(MERCHANT_ADD, DATA_DELETE)
#     end
#   end
# end
