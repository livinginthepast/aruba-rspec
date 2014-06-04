RSpec::Matchers.define :have_exit_status do |status|
  match do |ruby|
    raise ArgumentError, "expected should be a Proc" unless ruby.respond_to?(:call)
    ruby.call
    $?.exitstatus == status
  end

  def supports_block_expectations?
    true
  end

  failure_message do |ruby|
    "expected that code would exit #{status}"
  end

  failure_message_when_negated do |ruby|
    "expected that code would NOT exit #{status}"
  end

  description do
    "exit #{status}"
  end
end
