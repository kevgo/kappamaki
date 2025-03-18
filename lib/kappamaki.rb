module Kappamaki

  # Parses a given string containing key-value pairs into a Hash
  #
  # Values must be delimited by double-quotes, like this:
  # key: "value"
  def self.attributes_from_sentence sentence
    attributes = Kappamaki.from_sentence(sentence)
                          .map { |piece| piece.split ': ' }
                          .map { |key, value| [key.to_sym, value] }
                          .flatten
    Hash[*attributes]
  end


  # Reverse of ActiveSupport's "to_sentence" method
  def self.from_sentence sentence
    sentence.gsub(', and ', ', ')
            .gsub(' and ', ', ')
            .split(', ')
            .map { |s| s.delete '"' }
  end


  # Converts all keys in the given hash to symbols
  def self.symbolize_keys_deep! h
    h.keys.each do |k|
      ks    = k.to_sym
      h[ks] = h.delete k
      symbolize_keys_deep! h[ks] if h[ks].is_a? Hash
    end
  end

end
