require "json"
class YpApi::Listing
  attr_accessor :listing_id, :accreditations, :ad_image, :ad_image_click, :additional_texts, :after_hours_phone,
                :akas,:amenities,:associations,:attribution, :attribution_logo, :audio_url,
                :average_rating, :base_click_url, :business_name, :categories, :certification,
                :city, :coupon_flag, :coupon_image_url, :coupon_url, :coupons, :custom_link,
                :custom_link_text, :description1, :description2, :distrib_ad_image, :distrib_ad_image_click,
                :email, :emergency_phone, :extra_emails, :extra_fax, :extra_phone, :extra_toll_free,
                :extra_website_urls, :general_info, :has_display_address, :has_priority_shading,
                :in_business_since, :is_red_listing, :languages_spoken, :latitude, :longitude,
                :mobile_phone, :more_info_url, :neighborhoods, :omit_address, :omit_phone, :open_hours,
                :payment_methods, :phone, :primary_category, :print_ad_image, :print_ad_image_click,
                :rating_count, :services, :slogan, :state, :street, :video_url, :view_phone, :website_url,
                :zip
  @@path = "/listings/v1/details"
  def self.path
    @@path
  end
  def self.find(id)
    res = YpApi::Connection.get(path,:format => :json,:listingid => id.to_s)
    data = JSON.parse(res)['listingsDetailsResult']
    #debugger
    return nil unless data && data["listingsDetails"] && data['listingsDetails']['listingDetail']
    new(data['listingsDetails']['listingDetail'].first)
  end
  def initialize(data = {})
    data.each do |name,val|
      send("#{name.scan(/[a-z0-9]+|[A-Z]+[a-z0-9]*/).map(&:downcase).join("_")}=",val)
    end
  end
end