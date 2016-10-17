class Translation
  CODON_AND_PROTEINS = { 'Methionine' => ['AUG'],
                          'Phenylalanine' => ['UUU', 'UUC'],
                          'Leucine' => ['UUA', 'UUG'],
                          'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
                          'Tyrosine' => ['UAU', 'UAC'],
                          'Cysteine' => ['UGU', 'UGC'],
                          'Tryptophan' => ['UGG'],
                          'STOP' => ['UAA', 'UAG', 'UGA']
  }

  def self.of_codon(str)
    result = CODON_AND_PROTEINS.select { |protein, codon| codon.include?(str) }
    result.keys.join
  end
  
  def self.convert_rna_to_codon(str)
    result = []
    index = 0
    length = 3
    
    while index < str.length
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
  
  def self.invalid?(strand)
    true
  end
  
  def self.of_rna(str)
    # raise InvalidCodonError, if invalid?(str)
    result = convert_rna_to_codon(str).map { |codon| of_codon(codon) }
    clean_up(result)
  end
end

p Translation.of_rna('AUG')
