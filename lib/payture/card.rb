class Payture::Card < Payture::Wallet

  PATH_LIST = '/vwapi/GetList'
  PATH_REMOVE = '/vwapi/Remove'

  def list(vwid, data)
    self.request(PATH_LIST, vwid, data)
  end

  def remove(vwid, data)
    self.request(PATH_REMOVE, vwid, data)
  end

end
