module YpApi
  @@base_url = "http://api2.yp.com"
  @@key = "CHANGEME"
  def self.key
    @@key
  end
  def self.key=(k)
    @@key = k
  end
  def self.base_url
    @@base_url
  end
  def self.base_url=(u)
    @@base_url = u
  end
end