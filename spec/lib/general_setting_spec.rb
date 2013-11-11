require 'spec_helper'
require 'active_record_helper'
require './app/models/general_setting'

describe GeneralSetting do

  context "when a key/value is present" do
    let(:test_record) { GeneralSetting.new(key: test_key, value: test_value) }
    let(:test_key)   { 'test key' }
    let(:test_value) { 'test value' }

    before do
      GeneralSetting.should_receive(:find_by_key).with(test_key).and_return(test_record)
    end

    it "will find the value by [key]" do
      expect(GeneralSetting[test_key]).to be(test_value)
    end

    it "will find the value with fetch(key)" do
      expect(GeneralSetting.fetch(test_key)).to be(test_value)
    end
  end


  context "when a key/value is not present" do
    let(:test_key) { 'key' }
    let(:default)  { double("default") }

    before do
      GeneralSetting.should_receive(:find_by_key).with(test_key).and_return(nil)
    end

    it "will return nil by [key]" do
      expect(GeneralSetting[test_key]).to be(nil)
    end

    it "will raise a KeyError by fetch(key)" do
      expect { GeneralSetting.fetch(test_key) }.to raise_error(KeyError)
    end

    it "will return the default by fetch(key, default)" do
      expect(GeneralSetting.fetch(test_key, default)).to be(default)
    end

    it "will return the result of block if given by fetch(key) {}" do
      expect(GeneralSetting.fetch(test_key) { default }).to be(default)
    end
  end

end

