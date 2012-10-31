require "json"
class YpApi::Review
  attr_accessor :rating, :review_body, :review_date, :review_subject, :reviewer
  @@path = "/listings/v1/reviews"
  def self.path
    @@path
  end
  def self.all_for_listing(id)
    res = YpApi::Connection.get(path,:format => :json,:listingid => id.to_s)
    data = JSON.parse(res)['ratingsAndReviewsResult']
    return [] unless data && data["reviews"] && data["reviews"]["review"] 
    reviews = []
    data["reviews"]["review"].each do |review_json|  
      reviews <<  new(review_json)
    end
    reviews
  end
  def initialize(data = {})
    data.each do |name,val|
      send("#{name.scan(/[a-z0-9]+|[A-Z]+[a-z0-9]*/).map(&:downcase).join("_")}=",val)
    end
  end
end
