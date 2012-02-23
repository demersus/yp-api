module YpApi
  module Testing
    def stub_api_response(verb,url,opts = {})
      api = FakeApi.new(opts)
      stub_request(verb,url).to_rack(api)
      api # return instance
    end
    def file_fixture(filename)
      open(File.join(File.dirname(__FILE__), 'fixtures', "#{filename.to_s}")).read
    end 
    
    class FakeApi
      attr_accessor :headers, :response_code, :body, :auth
      def initialize(opts)
        self.response_code = opts[:code] || 200
        self.headers = {
          'Content-Type' => opts[:content_type] || 'text/plain'
        }
        self.body = opts[:body] || ''
      end
      def response
        # Extracted for message testing in rspec
        # inst.should_receive(:call){|env| ... test input ... }.and_return(inst.response)
        [@response_code,@headers,[@body.strip]]
      end
      def call(env)
        response
      end
      def body=(b)
        @headers['Content-Length'] = b.length.to_s
        @body = b
      end
    end
  end
end