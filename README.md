# Kappamaki <a href="https://travis-ci.org/Originate/kappamaki" alt="Build Status" target="_blank"><img src="https://travis-ci.org/Originate/kappamaki.svg?branch=master"></a>

_Tools for natural, high-level, sophisticated Cucumber steps._

The name comes from the sushi roll filled with pieces of cucumber,
which adds naturalness and freshness to a meal.


## Usage

Kappamaki provides a number of helper methods that can be used directly
in your Cucumber step definitions.
It allows for Cucumber steps that look like this:

```cucumber
Given I have a dinner with starter: "miso soup" and entree: "sushi"
```

Your step definition would look like this:

```ruby
Given /^I have a dinner with (.+)$/ do |dinner_attributes|

  # dinner_attributes is this string:
  'starter: "miso soup" and entree: "sushi"'

  # Let's parse that string using Kappamaki
  dinner_data = Kappamaki.attributes_from_sentence(dinner_attributes)

  # The result, dinner_data, is this hash:
  { starter: "miso soup",
    entree: "sushi" }

  # now we can set up our system using this data
  create :dinner, dinner_data
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
