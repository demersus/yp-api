require 'rest_client'
class YpApi::Connection
  def self.get(path,opts = {})
    RestClient.get(YpApi.base_url + path,:params => opts.merge(:key => YpApi.key))
  end  
end