Aruba::RSpec
============

Aruba and ArubaDoubles are tools for testing command-line programs using
Cucumber. They allow for setting up command stubs, then testing
expectations on those stubs. This gem helps to integrate the two
directly in RSpec.

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'aruba-rspec'
end
```

## Usage

Add `aruba-rspec` to your `spec_helper.rb` file as follows:

```ruby
require 'aruba/rspec'

RSpec.configure do |config|
  config.include Aruba::RSpec

  config.before :each do
    Aruba::RSpec.setup
  end

  config.after :each do
    Aruba::RSpec.teardown
  end
end
```

## Command doubles

This comes out of ArubaDoubles:

```ruby
describe 'Using doubles' do
  before do
    double_cmd('which', puts: '/some/path')
    double_cmd('sudo', warn: 'No!', exit: 1)
  end

  it 'can run a command that succeeds' do
    expect(`which thing`).to eq('/some/path')
    expect($?.exitstatus).to eq(0)
  end

  it 'can run a command that fails' do
    expect(`sudo do soemthing`).to be nil
    expect($?.exitstatus).to eq(1)
  end
end
```

## Matchers

### :shellout

```ruby
describe MyThing do
  it 'calls out to an external command' do
    double_cmd('thing')
    expect {
	  `thing --with --options`
    }.to shellout('thing --with --options')
  end
end
```

## References

* `https://github.com/cucumber/aruba`
* `https://github.com/bjoernalbers/aruba-doubles`

## Contributing

1. Fork it ( http://github.com/<my-github-username>/aruba-rspec/fork )
2. Use feature branches
3. Write tests for any changes
