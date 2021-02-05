require 'rails_helper'

RSpec.describe ShortUrl do

  let(:url) { Faker::Internet.url }

  it "should encode URL" do
    key = ShortUrl.encode(url)

    expect(key).to_not be_nil
    expect(key).to be_a(String)
  end

end