class Payture::Wallet < Payture::API

  PATH_INIT   = '/vwapi/Init'

  def init(vwid, data)
    self.request(PATH_INIT, vwid, data)
  end

end
