require 'rails_helper'

RSpec.describe MemoryBuffer do

  before(:all) do
    @registry = { key: Faker::Internet.uuid, url: Faker::Internet.url }
  end

  it "when intialized the array of registries should be empty" do
    expect(MemoryBuffer.all_registries).to be_empty
  end

  it "when added a registry it should store in the registries array" do
    MemoryBuffer.insert(@registry)

    expect(MemoryBuffer.all_registries).to_not be_empty
    expect(MemoryBuffer.all_registries.length).to eq(1)
  end

  describe "search a registry" do

    context "when a registered registry" do

      it "by key" do
        result_search = MemoryBuffer.find_by_key(@registry[:key])

        expect(result_search).to_not be_nil
        expect(result_search[:url]).to eq(@registry[:url])
      end

      it "by url" do

        result_search = MemoryBuffer.find_by_url(@registry[:url])

        expect(result_search).to_not be_nil
        expect(result_search[:key]).to eq(@registry[:key])

      end

    end

    context "when not a registered registry should return nil" do

      it "by key" do
        result_search = MemoryBuffer.find_by_key(Faker::Internet.uuid)

        expect(result_search).to be_nil
      end

      it "by url" do
        result_search = MemoryBuffer.find_by_url(Faker::Internet.uuid)

        expect(result_search).to be_nil
      end

    end

  end

end
