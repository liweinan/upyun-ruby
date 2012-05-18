require 'net/http'
require 'uri'
require 'digest/md5'

class UpYun
  attr_accessor :bucketname, :username, :password
  attr_accessor :api_domain

  def initialize(bucketname, username, password, api_domain = "v0.api.upyun.com")
    @bucketname = bucketname
    @username = username
    @password = Digest::MD5.hexdigest(password)
    @api_domain = api_domain
  end

  def writeFile(filepath, fd, mkdir='true')
    url = "http://#{api_domain}/#{bucketname}#{filepath}"
    uri = URI.parse(url)

    Net::HTTP.start(uri.host, uri.port) do |http|
      date = getGMTDate
      length = File.size(fd)
      method = 'PUT'
      headers = {
          'Date' => date,
          'Content-Length' => length.to_s,
          'Authorization' => sign(method, getGMTDate, "/#{@bucketname}#{filepath}", length),
          'mkdir' => mkdir
      }

      response = http.send_request(method, uri.request_uri, fd.read, headers)
      puts response
    end
  end

  def getGMTDate
    Time.now.utc.strftime('%a, %d %b %Y %H:%M:%S GMT')
  end

  def sign(method, date, url, length)
    String sign = "#{method}&#{url}&#{date}&#{length}&#{password}"
    puts sign
    "UpYun #{@username}:#{Digest::MD5.hexdigest(sign)}"
  end

end

