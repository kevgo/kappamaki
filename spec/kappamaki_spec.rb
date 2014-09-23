require 'spec_helper'
require 'kappamaki'


describe Kappamaki do

  test_data = {

    attributes_from_sentence: {
      'name: "Foo"'                                => {name: "Foo"},
      'name: "Foo" and body: "Bar"'                => {name: 'Foo', body: 'Bar'},
      'name: "Foo", body: "Bar" and title: "Baz"'  => {name: 'Foo', body: 'Bar', title: "Baz"},
      'name: "Foo", body: "Bar", and title: "Baz"' => {name: 'Foo', body: 'Bar', title: "Baz"}
    },

    from_sentence: {
      'one'                              => ['one'],
      '"one"'                            => ['one'],
      'one and two'                      => ['one', 'two'],
      '"one" and "two"'                  => ['one', 'two'],
      'one, two and three'               => ['one', 'two', 'three'],
      '"one", "two" and "three"'         => ['one', 'two', 'three'],
      'one, two, and three'              => ['one', 'two', 'three'],
      'one, two, three and four'         => ['one', 'two', 'three', 'four'],
      '"one", "two", "three" and "four"' => ['one', 'two', 'three', 'four']
    }
  }

  test_data.each do |method_name, expected|
    describe method_name do
      expected.each do |sentence, expected_result|
        it "parses '#{sentence}' into '#{expected_result}'" do
          expect(Kappamaki.send method_name, sentence).to eql expected_result
        end
      end
    end
  end
end

