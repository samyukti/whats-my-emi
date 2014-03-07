require File.expand_path '../spec_helper.rb', __FILE__

describe "What's My EMI" do
  it "should allow accessing the home page" do
    get '/'
    last_response.should be_ok
  end

  context 'on the home page' do
    it "should have an input for principal" do
      get '/'
      last_response.body.include?('Enter principal amount')
    end

    it "should have an input for rate" do
      get '/'
      last_response.body.include?('Enter rate')
    end

    it "should have an input for term" do
      get '/'
      last_response.body.include?('Enter term')
    end
  end

  context 'on invoking the api' do
    it "returns ok with valid parameters" do
      get '/emi.json?p=10000&r=10&t=120'
      last_response.body.include?('132.15')
    end

    it "returns null with invalid parameters" do
      get '/emi.json'
      last_response.body.include?('"payment":null')
    end

    it "returns null without parameters" do
      get '/emi.json'
      last_response.body.include?('"payment":null')
    end
  end
end