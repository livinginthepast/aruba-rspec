RSpec::Matchers.define :have_exit_status do |status|
  match do |ruby|
    raise ArgumentError, "expected should be a Proc" unless ruby.respond_to?(:call)
    ruby.call
    $?.exitstatus == status
  end

  failure_message_for_should do |ruby|
    "expected that code would exit #{status}"
  end

  failure_message_for_should_not do |ruby|
    "expected that code would NOT exit #{status}"
  end

  description do
    "exit #{status}"
  end
end
