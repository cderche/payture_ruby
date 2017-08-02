class Payture::Card < Payture::Wallet

  PATH_LIST = '/vwapi/GetList'

  def list(vwid, data)
    self.request(PATH_LIST, vwid, data)
  end

end
