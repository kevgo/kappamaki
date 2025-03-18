[![CI](https://github.com/kevgo/kappamaki/actions/workflows/ruby.yml/badge.svg)](https://github.com/kevgo/kappamaki/actions/workflows/ruby.yml)
[![Coverage Status](https://coveralls.io/repos/kevgo/kappamaki/badge.svg?branch=master&service=github)](https://coveralls.io/github/kevgo/kappamaki?branch=master)

Kappamaki provides helper methods that can be used in your Cucumber step definitions.
The name comes from the sushi roll filled with cucumber.

### from_sentence

Parses a list of values from a sentence.

```cucumber
Given the restaurant offers cucumber rolls, philadelphia rolls, and avocado rolls
```

Your definition to parse this Cucumber step would look like this:

```ruby
Given /^the restaurant offers (.+)$/ do |menu_list|

  # "menu_list" is this string:
  'cucumber rolls, philadelphia rolls, and avocado rolls'

  # let's parse this into an array
  menu = Kappamaki.from_sentence menu_list

  # the result (the variable "menu") is this array:
  ['cucumber rolls', 'philadelphia rolls', 'avocado rolls']

  # Now we can set up our menu here...
end
```


### attributes_from_sentence

Parses key-value pairs from natural sentences.

```cucumber
When I order a dinner with starter: "miso soup" and entree: "cucumber rolls"
```

Your step definition would look like this:

```ruby
When /^I order a dinner with (.+)$/ do |order_items|

  # order_items is this string:
  'starter: "miso soup" and entree: "cucumber rolls"'

  # Let's parse that string using Kappamaki
  order_data = Kappamaki.attributes_from_sentence order_items

  # The result, order_data, is this hash:
  { starter: 'miso soup',
    entree: 'cucumber rolls' }

  # now we can set up our order...
  create :order, order_data
end
```


### symbolize_keys_deep

Converts the keys of a hash into symbols.

```cucumber
Then I am served these items
  | name          | count |
  | miso soup     | 1     |
  | cucumber roll | 8     |
```

Your step definition would look like this:

```ruby
Then ^I am served these items do |entrees|
  entrees.hashes.each do |entree|

    # entree is this hash:
    { 'name' => 'miso soup', 'count' => '1' }

    # Let's convert the keys to symbols.
    Kappamaki.symbolize_keys_deep! entree

    # Now entree is this hash:
    { name: 'miso soup', count: '1' }

    # Now we can use this hash in places that expect hashes with symbols
    expect(order).to include entree
  end
end
```


## Installation

* add `gem 'kappamaki'` to your application's Gemfile
* run `bundle install`
* add `require 'kappamaki'` to your `/features/support/env.rb` file


## Development

* run tests: `bundle exec rake`
* update dependencies: `bundle update`
* push a new version to Rubygems: `rake release`
