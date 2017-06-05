class Payture::Wallet < Payture::API

  PATH_INIT = '/vwapi/Init'
  PATH_PAY  = '/vwapi/Pay'

  def init(vwid, data)
    self.request(PATH_INIT, vwid, data)
  end
  
  def pay(vwid, data)
    self.request(PATH_PAY, vwid, data)
  end

end
