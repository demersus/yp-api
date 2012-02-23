require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe YpApi::Listing do
  subject{described_class}
  it {should respond_to :path}
  describe ".find" do
    context "Given a valid listing_id(81344) as the first parameter" do
      before do
        @listing_id = 81344
        full_url = YpApi.base_url + YpApi::Listing.path + "?" + URI.encode_www_form(:format => :json,:key => YpApi.key,:listingid=>@listing_id)
        stub_request(:get,full_url).to_return(:body => file_fixture('listing_81344.json')) 
      end
      describe "The Result" do
        subject{YpApi::Listing.find(@listing_id)}
        it {should be_a YpApi::Listing}
        its(:listing_id){should eql @listing_id}
        its(:business_name){should_not be_nil}
      end      
    end 
  end
end