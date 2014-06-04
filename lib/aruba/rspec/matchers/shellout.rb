RSpec::Matchers.define :shellout do |cmd|
  match do |ruby|
    raise ArgumentError, "expected should be a Proc" unless ruby.is_a?(Proc)
    ruby.call
    Aruba::RSpec.history.include?(cmd.shellsplit)
  end

  def supports_block_expectations?
    true
  end

  failure_message do |ruby|
    "expected that code would run command #{cmd}\nfound: #{Aruba::RSpec.history.map(&:shelljoin)}"
  end

  failure_message_when_negated do |ruby|
    "expected that code would NOT run command #{cmd}"
  end

  description do
    "run command #{cmd}"
  end
end
