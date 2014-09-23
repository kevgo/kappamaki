# Kappamaki <a href="https://travis-ci.org/Originate/kappamaki" alt="Build Status" target="_blank"><img src="https://travis-ci.org/Originate/kappamaki.svg?branch=master"></a>

_Tools for natural, high-level, sophisticated Cucumber steps._

The name comes from the delicious sushi filled with pieces of cucumber.


## Usage

Kappamaki provides a number of helper methods that can be used directly
in your Cucumber step definitions.
It allows for Cucumber steps that look like this:

```cucumber
Given I have a dinner with starter: "miso soup", entree: "sushi", and beverage: "matcha"
```

Your step definition would look like this:

```ruby
Given /^I have a dinner with (.+)$/ do |dinner_attributes|

  # dinner_attributes is this string:
  'starter: "miso soup", entree: "sushi", and beverage: "matcha"'

  # Let's parse that string using Kappamaki
  expected_dinner = Kappamaki.attributes_from_sentence dinner_attributes

  # expected_dinner is this hash:
  { starter: "miso soup",
    entree: "sushi",
    beverage: "matcha" }

  # Now we can verify this hash easily against our system under test
  expect(actual_dinner).to eq expected_dinner
end
```


## Installation

* add `gem 'kappamaki'` to your application's Gemfile
* run `bundle install`
* add `require 'kappamaki'` to your `/features/support/env.rb` file


## Contributing

1. Fork it ( https://github.com/Originate/kappamaki/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
