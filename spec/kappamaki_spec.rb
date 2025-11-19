require "spec_helper"
require "kappamaki"

describe Kappamaki do
  describe ".attributes_from_sentence" do
    test_data = {
      'name: "Foo"' => { name: "Foo" },
      'name: "Foo" and body: "Bar"' => { name: "Foo", body: "Bar" },
      'name: "Foo", body: "Bar" and title: "Baz"' => { name: "Foo", body: "Bar", title: "Baz" },
      'name: "Foo", body: "Bar", and title: "Baz"' => { name: "Foo", body: "Bar", title: "Baz" }
    }
    test_data.each do |give, want|
      it "parses '#{give}' into '#{want}'" do
        have = Kappamaki.attributes_from_sentence(give)
        expect(have).to eql want
      end
    end

    it "raises ArgumentError when given non-string input" do
      expect { Kappamaki.attributes_from_sentence(nil) }.to raise_error(ArgumentError, "sentence must be a String")
      expect { Kappamaki.attributes_from_sentence(123) }.to raise_error(ArgumentError, "sentence must be a String")
    end
  end

  describe ".from_sentence" do
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
    test_data.each do |give, want|
      it "parses '#{give}' into '#{want}'" do
        have = Kappamaki.from_sentence(give)
        expect(have).to eql want
      end
    end

    it "handles empty string" do
      expect(Kappamaki.from_sentence("")).to eq []
    end

    it "raises ArgumentError when given non-string input" do
      expect { Kappamaki.from_sentence(nil) }.to raise_error(ArgumentError, "sentence must be a String")
      expect { Kappamaki.from_sentence([]) }.to raise_error(ArgumentError, "sentence must be a String")
    end
  end

  describe ".symbolize_keys_deep!" do
    it "converts string keys to symbols" do
      actual = { "one" => "two", "alpha" => "beta" }
      Kappamaki.symbolize_keys_deep!(actual)
      expect(actual).to eq one: "two", alpha: "beta"
    end

    it "converts nested keys" do
      actual = { "one" => { "alpha" => "beta" } }
      Kappamaki.symbolize_keys_deep!(actual)
      expect(actual).to eq one: { alpha: "beta" }
    end

    it "handles arrays containing hashes" do
      actual = { "items" => [{ "name" => "foo" }, { "name" => "bar" }] }
      Kappamaki.symbolize_keys_deep!(actual)
      expect(actual).to eq items: [{ name: "foo" }, { name: "bar" }]
    end

    it "handles arrays containing non-hash values" do
      actual = { "items" => ["foo", "bar", 123] }
      Kappamaki.symbolize_keys_deep!(actual)
      expect(actual).to eq items: ["foo", "bar", 123]
    end

    it "handles empty hash" do
      actual = {}
      result = Kappamaki.symbolize_keys_deep!(actual)
      expect(result).to eq({})
      expect(actual).to eq({})
    end

    it "returns the modified hash" do
      actual = { "one" => "two" }
      result = Kappamaki.symbolize_keys_deep!(actual)
      expect(result).to eq one: "two"
      expect(result).to be(actual)
    end

    it "raises ArgumentError when given non-hash input" do
      expect { Kappamaki.symbolize_keys_deep!(nil) }.to raise_error(ArgumentError, "hash must be a Hash")
      expect { Kappamaki.symbolize_keys_deep!("string") }.to raise_error(ArgumentError, "hash must be a Hash")
    end
  end
end
