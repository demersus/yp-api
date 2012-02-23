$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'yaml'
require 'ruby-debug'
require 'webmock/rspec'
require 'rack'
require 'yp-api'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
def file_fixture(filename)
  open(File.join(File.dirname(__FILE__), 'fixtures', "#{filename.to_s}")).read
end
RSpec.configure do |config|
  config.before(:suite) do
    WebMock.disable_net_connect!
  end
  config.after(:suite) do
    WebMock.allow_net_connect!
  end
end
