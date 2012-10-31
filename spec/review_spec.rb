require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe YpApi::Review do
  subject{described_class}
  it {should respond_to :path}
  describe ".all_for_listing" do
    context "Given a valid listing_id(81344) as the first parameter" do
      before do
        @listing_id = 81344
        full_url = YpApi.base_url + YpApi::Review.path + "?" + URI.encode_www_form(:format => :json,:key => YpApi.key,:listingid=>@listing_id)
        stub_request(:get,full_url).to_return(:body => file_fixture('review_81344.json')) 
      end
      describe "The Result" do
        subject{YpApi::Review.all_for_listing(@listing_id)}
        it {should be_a Array}
        its(:count){should eql 5}
        its(:first){should be_a YpApi::Review}
      end      
    end
    context "Given a valid listing_id(7602113) with no reviews" do
      before do
        @listing_id = 7602113
        full_url = YpApi.base_url + YpApi::Review.path + "?" + URI.encode_www_form(:format => :json,:key => YpApi.key,:listingid=>@listing_id)
        stub_request(:get,full_url).to_return(:body => file_fixture('review_none_7602113.json')) 
      end
      describe "The Result" do
        subject{YpApi::Review.all_for_listing(@listing_id)}
        it {should be_a Array}
        its(:count){should eql 0}
      end    
    end
     
  end
end
