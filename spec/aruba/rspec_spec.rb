require 'spec_helper'

describe Aruba::RSpec do
  describe '::history' do
    it 'should be an ArubaDoubles::History' do
      expect(Aruba::RSpec.history).to be_an(ArubaDoubles::History)
    end
  end

  describe '::setup' do
    it 'sets up ArubaDoubles' do
      ArubaDoubles::Double.stub(:setup)
      Aruba::RSpec.setup
      expect(ArubaDoubles::Double).to have_received(:setup)
    end
  end

  describe '::teardown' do
    before { ArubaDoubles::Double.stub(:teardown) }

    it 'tears down ArubaDoubles' do
      Aruba::RSpec.teardown
      expect(ArubaDoubles::Double).to have_received(:teardown)
    end

    it 'clears the history' do
      Aruba::RSpec.history.stub(:clear)
      Aruba::RSpec.teardown
      expect(Aruba::RSpec.history).to have_received(:clear)
    end
  end
end
