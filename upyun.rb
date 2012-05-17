require 'net/http'
require 'uri'

class UpYun
  attr_accessor :bucketname, :username, :password
  attr_accessor :api_domain
  
  def initialize(bucketname, username, password, api_domain = "v0.api.upyun.com")
    @bucketname = bucketname
    @username = username
    @password = password
    @api_domain = api_domain
  end
  
  def writeFile(filepath, fd, mkdir)
    url = "http://#{api_domain}/#{bucketname}#{filepath}"
    uri = URI.parse(url)
    
    Net::HTTP.start(uri.host, uri.port) do |http|
      headers = {
        'Authorization' => 
      }
    end
  end
  
  def sign(method, date, url, length)
    String sign = "#{method}&#{url}&#{date}&#{length}&#{password}"
    "UpYun#{@username}:#{md5(sign)}"
  end

end