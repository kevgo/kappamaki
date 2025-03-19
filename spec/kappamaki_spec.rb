require "spec_helper"
require "kappamaki"

describe :attributes_from_sentence do
  test_data = {
    'name: "Foo"' => { name: "Foo" },
    'name: "Foo" and body: "Bar"' => { name: "Foo", body: "Bar" },
    'name: "Foo", body: "Bar" and title: "Baz"' => { name: "Foo", body: "Bar", title: "Baz" },
    'name: "Foo", body: "Bar", and title: "Baz"' => { name: "Foo", body: "Bar", title: "Baz" }
  }
  test_data.each do |sentence, expected_result|
    it "parses '#{sentence}' into '#{expected_result}'" do
      expect(Kappamaki.attributes_from_sentence(sentence)).to eql expected_result
    end
  end
end

describe :from_sentence do
  test_data = {
    "one" => ["one"],
    '"one"' => ["one"],
    "one and two" => %w[one two],
    '"one" and "two"' => %w[one two],
    "one, two and three" => %w[one two three],
    '"one", "two" and "three"' => %w[one two three],
    "one, two, and three" => %w[one two three],
    "one, two, three and four" => %w[one two three four],
    '"one", "two", "three" and "four"' => %w[one two three four]
  }
  test_data.each do |sentence, expected_result|
    it "parses '#{sentence}' into '#{expected_result}'" do
      expect(Kappamaki.from_sentence(sentence)).to eql expected_result
    end
  end
end

describe "symbolize_keys_deep!" do

  it "converts string keys to symbols" do
    actual = { "one" => "two", "alpha" => "beta" }
    Kappamaki.symbolize_keys_deep! actual
    expect(actual).to eq one: "two", alpha: "beta"
  end

  it "converts nested keys" do
    actual = { "one" => { "alpha" => "beta" } }
    Kappamaki.symbolize_keys_deep! actual
    expect(actual).to eq one: { alpha: "beta" }
  end

end
