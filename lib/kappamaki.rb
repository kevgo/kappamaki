# Kappamaki provides helper methods to implement Cucumber steps
# that define data using natural language.
module Kappamaki
  # Parses a given string containing key-value pairs into a Hash
  #
  # Values must be delimited by double-quotes, like this:
  # key: "value"
  #
  # @param sentence [String] the sentence to parse
  # @return [Hash] the parsed key-value pairs
  # @raise [ArgumentError] if sentence is not a String
  def self.attributes_from_sentence(sentence)
    attributes = Kappamaki.from_sentence(sentence)
                          .map { |piece| piece.split ": " }
                          .map { |key, value| [key.to_sym, value] }
                          .flatten
    Hash[*attributes]
  end

  # Reverse of ActiveSupport's "to_sentence" method
  #
  # @param sentence [String] the sentence to parse
  # @return [Array<String>] the parsed array of items
  # @raise [ArgumentError] if sentence is not a String
  def self.from_sentence(sentence)
    raise ArgumentError, "sentence must be a String" unless sentence.is_a?(String)

    sentence.gsub(", and ", ", ")
            .gsub(" and ", ", ")
            .split(", ")
            .map { |s| s.delete('"') }
  end

  # Converts all keys in the given hash to symbols
  #
  # @param hash [Hash] the hash to modify
  # @return [Hash] the modified hash with symbolized keys
  # @raise [ArgumentError] if hash is not a Hash
  def self.symbolize_keys_deep!(hash)
    raise ArgumentError, "hash must be a Hash" unless hash.is_a?(Hash)

    hash.keys.each do |k|
      ks = k.to_sym
      hash[ks] = hash.delete(k)
      symbolize_keys_deep!(hash[ks]) if hash[ks].is_a?(Hash)
    end
  end
end
