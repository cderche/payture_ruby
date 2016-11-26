require 'net/http'
require 'uri'
require 'active_support/all'
# require 'ostruct'
require 'payture/hash'

class Payture::API
  def initialize(host)
    raise ArgumentError, "host is required" if not host
    @host = host
  end

  def host
    @host
  end

  def request(path, merchant, params)
    data      = { VWID: merchant, DATA: params.url_encode }
    puts "request.data: #{data}"

    uri       = URI::HTTP.build({ host: @host, path: path })
    puts "URI: #{uri}"
    http      = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req       = Net::HTTP::Post.new(uri.request_uri)
    req.body  = data.to_query
    puts "request: #{req}"
    res       = http.request(req)

    # OpenStruct.new(Hash.from_xml(res.body).downcase_key)
    Hash.from_xml(res.body)
  end

end
