require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe YpApi do
  subject{described_class}
  
  it {should respond_to :key}
  it {should respond_to 'key='}
  it {should respond_to :base_url}
  it {should respond_to 'base_url='}
  
end
