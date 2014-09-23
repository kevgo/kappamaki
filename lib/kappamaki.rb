module Kappamaki

  # Parses a given list of key-value pairs into a Hash
  def self.attributes_from_sentence sentence
    attributes = Kappamaki.from_sentence(sentence)
                          .map{|a| a.split ': '}
                          .map{|key, value| [key.to_sym, value]}
    Hash[*attributes.flatten]
  end


  # Reverse of Rails' to_sentence method
  def self.from_sentence sentence
    sentence.gsub(', and ', ', ')
            .gsub(' and ', ', ')
            .split(', ')
            .map{|s| s.gsub '"', ''}
  end

end
