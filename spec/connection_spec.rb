require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe YpApi::Connection do
  subject{described_class}
  it{should respond_to :get}
  
  context "calling .get with a valid api path and url params" do
    before do
      @valid_path = "/listings/v1/search"
      @valid_params = {:searchloc => 83854, :term => "saw blades",:key => YpApi.key}
      @full_url = YpApi.base_url + @valid_path + '?' + URI.encode_www_form(@valid_params)
      stub_request(:any,@full_url).to_return(:body => "{}")
    end
    
    describe "the response" do
      
      subject{described_class.get(@valid_path,@valid_params)}
      it {should be_a RestClient::Response}
      its(:code){should be 200}
    end
  end
end