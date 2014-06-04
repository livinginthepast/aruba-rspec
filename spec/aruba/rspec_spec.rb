require 'spec_helper'

describe Aruba::RSpec do
  describe '::history' do
    it 'should be an ArubaDoubles::History' do
      expect(Aruba::RSpec.history).to be_an(ArubaDoubles::History)
    end
  end

  describe '::setup' do
    it 'sets up ArubaDoubles' do
      allow(ArubaDoubles::Double).to receive(:setup)
      Aruba::RSpec.setup
      expect(ArubaDoubles::Double).to have_received(:setup)
    end
  end

  describe '::teardown' do
    before do
      allow(ArubaDoubles::Double).to receive(:teardown)
    end

    it 'tears down ArubaDoubles' do
      Aruba::RSpec.teardown
      expect(ArubaDoubles::Double).to have_received(:teardown)
    end

    it 'clears the history' do
      allow(Aruba::RSpec.history).to receive(:clear)
      Aruba::RSpec.teardown
      expect(Aruba::RSpec.history).to have_received(:clear)
    end
  end
end
