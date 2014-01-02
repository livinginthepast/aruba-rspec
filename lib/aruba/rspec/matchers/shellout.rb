RSpec::Matchers.define :shellout do |cmd|
  match do |ruby|
    raise ArgumentError, "expected should be a Proc" unless ruby.is_a?(Proc)
    ruby.call
    Aruba::RSpec.history.include?(cmd.shellsplit)
  end

  failure_message_for_should do |ruby|
    "expected that code would run command #{cmd}\nfound: #{Aruba::RSpec.history.map(&:shelljoin)}"
  end

  failure_message_for_should_not do |ruby|
    "expected that code would NOT run command #{cmd}"
  end

  description do
    "run command #{cmd}"
  end
end
