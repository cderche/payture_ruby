class Payture::Wallet < Payture::API

  PATH_INIT = '/vwapi/Init'
  PATH_PAY = '/vwapi/Pay'
  # PATH_CHARGE = '/vwapi/Charge'

  def init(vwid, data)
    self.request(PATH_INIT, vwid, data)
  end

  def pay(vwid, data)
    self.request(PATH_PAY, vwid, data)
  end

  # def charge(vwid, data)
  #   self.request(PATH_CHARGE, vwid, data)
  # end

end
