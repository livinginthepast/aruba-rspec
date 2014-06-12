require 'spec_helper'

describe 'have_exit_status matcher' do
  before { Aruba::RSpec.setup }
  after { Aruba::RSpec.teardown }

  describe 'validations' do
    it 'raises unless given a proc' do
      expect {
        expect(nil).to shellout('thing')
      }.to raise_error(ArgumentError, 'expected should be a Proc')
    end
  end

  context 'when command exit status matches expectations' do
    it 'succeeds' do
      double_cmd('thing', exit: 100)
      expect { `thing` }.to have_exit_status(100)
    end
  end

  context 'when command exit status fails expectations' do
    it 'fails' do
      double_cmd('thing', exit: 101)
      expect {
        expect { `thing` }.to have_exit_status(100)
      }.to raise_error(RSpec::Expectations::ExpectationNotMetError, /expected that code would exit 100, instead exited 101/)
    end
  end
end
