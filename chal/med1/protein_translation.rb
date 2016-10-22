class InvalidCodonError < StandardError
end

class Translation
  CODON_AND_PROTEINS = {  'Methionine' => ['AUG'],
                          'Phenylalanine' => ['UUU', 'UUC'],
                          'Leucine' => ['UUA', 'UUG'],
                          'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
                          'Tyrosine' => ['UAU', 'UAC'],
                          'Cysteine' => ['UGU', 'UGC'],
                          'Tryptophan' => ['UGG'],
                          'STOP' => ['UAA', 'UAG', 'UGA']
  }.freeze

  def self.of_codon(str)
    result = CODON_AND_PROTEINS.select do |_, codon|
      codon.include?(str)
    end
    result.keys.join
  end

  def self.convert_rna_to_codon(str)
    result = []
    index = 0
    length = 3

    while index < str.length
      raise InvalidCodonError unless valid?(str.chars.slice(index, length).join)
      result << str.chars.slice(index, length).join
      index += 3
    end
    result
  end

  def self.clean_up(array)
    result = []
    index = 0
    until array[index] == 'STOP' || index >= array.size
      result << array[index]
      index += 1
    end
    result
  end

  def self.valid?(codon)
    CODON_AND_PROTEINS.values.flatten.include?(codon)
  end

  def self.of_rna(str)
    result = convert_rna_to_codon(str).map do |codon|
      of_codon(codon)
    end
    clean_up(result)
  end
end
