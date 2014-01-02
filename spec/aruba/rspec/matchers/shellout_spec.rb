require 'spec_helper'

describe 'shellout matcher' do
  before { Aruba::RSpec.setup }
  after { Aruba::RSpec.teardown }

  describe 'validations' do
    it 'raises if given something other than a proc' do
      expect {
        expect(nil).to shellout('thing')
      }.to raise_error(ArgumentError, 'expected should be a Proc')
    end
  end

  context 'when code calls out to a doubled command' do
    it 'succeeds' do
      double_cmd('thing')
      expect { `thing` }.to shellout('thing')
    end
    
    it 'matches arguments' do
      double_cmd('thing')
      expect { `thing --with --stuff` }.to shellout('thing --with --stuff')
    end

    it 'fails on unexpected arguments' do
      double_cmd('thing')
      expect {
        expect { `thing --with --stuff` }.to shellout('thing')
      }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected that code would run command thing/)
    end
  end

  context 'when code does not shell out' do
    it 'fails with error message' do
      expect {
        expect { "stuff" }.to shellout('thing')
      }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected that code would run command thing/)
    end
  end

  context 'when another command has run' do
    it 'fails with error message including ran command' do
      double_cmd('stuff')
      double_cmd('thing')

      expect {
        expect { `stuff` }.to shellout('thing')
      }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected that code would run command thing\n\s*found: \["stuff"\]/)
    end
  end
end
