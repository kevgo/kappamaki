module Kappamaki

  # Parses a given string containing key-value pairs into a Hash
  #
  # Values must be delimited by double-quotes, like this:
  # key: "value"
  def self.attributes_from_sentence sentence
    attributes = Kappamaki.from_sentence(sentence)
                          .map{|piece| piece.split ': '}
                          .map{|key, value| [key.to_sym, value]}
                          .flatten
    Hash[*attributes]
  end


  # Reverse of Rails' to_sentence method
  def self.from_sentence sentence
    sentence.gsub(', and ', ', ')
            .gsub(' and ', ', ')
            .split(', ')
            .map{|s| s.gsub '"', ''}
  end

end
