require 'aruba/rspec/version'

require 'aruba-doubles'
require 'aruba/rspec/matchers'

module Aruba
  module RSpec
    def self.history
      @history ||= ArubaDoubles::History.new(File.join(ArubaDoubles::Double.bindir, ArubaDoubles::HISTORY_FILE))
    end

    def self.setup
      ArubaDoubles::Double.setup
    end

    def self.teardown
      ArubaDoubles::Double.teardown
      history.clear
    end
  end
end
