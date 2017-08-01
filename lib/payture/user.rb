class Payture::User < Payture::Wallet

  PATH_REGISTER = '/vwapi/Register'
  PATH_UPDATE   = '/vwapi/Update'
  PATH_DELETE   = '/vwapi/Delete'
  PATH_CHECK    = '/vwapi/Check'

  def register(vwid, data)
    self.request(PATH_REGISTER, vwid, data)
  end

  def update(vwid, data)
    self.request(PATH_UPDATE, vwid, data)
  end

  def delete(vwid, data)
    self.request(PATH_DELETE, vwid, data)
  end

  def check(vwid, data)
    self.request(PATH_CHECK, vwid, data)
  end

end
