# dev notes:
# #min #max and #sort to handle the unequal lengths
# loops work well for this


# self critique:
# can remove the need for DNA#shorter_seq and DNA#longer_seq by using min max within the main method
# DNA#hamming_not_equal_length and DNA#hamming_equal_length are very similar - ripe for refactoring
# if we can consolidate the above methods, it's probably viable to add them back into
# DNA#hamming_distance and do away with them altogether
# seq1 and seq2 are a litte confusing
# use a range of indexes to iterate over - this does away with issues around finding longest/shortest

# from watching the video
# I went straight into comparing the strings even though I knew a length issue was coming up later
# I should have incorporated the length issue earlier as it's a precurser to completing the tests
# Possibly the reason for this was misunderstanding the problem and going at it a little quickly
# Next time need to plan a bit more thoroughly


class DNA
  attr_reader :orig_sequence

  def initialize(orig_sequence)
    @orig_sequence = orig_sequence
  end

  def sequences_equal_length?(seq1, seq2)
    seq1.length == seq2.length
  end

  def longer_seq(seq1, seq2)
    return seq1.chars if seq1.length > seq2.length
    seq2.chars
  end

  def shorter_seq(seq1, seq2)
    return seq1.chars if seq1.length < seq2.length
    seq2.chars
  end

  def hamming_equal_length(seq1, seq2)
    mutations = 0
    seq1.chars.each_with_index do |letter, index|
      mutations += 1 unless letter == seq2.chars[index]
    end
    mutations
  end

  def hamming_not_equal_length(seq1, seq2)
    mutations = 0
    long = longer_seq(seq1, seq2)
    short = shorter_seq(seq1, seq2)
    long.each_with_index do |letter, index|
      return mutations if short[index].nil?
      mutations += 1 unless letter == short[index]
    end
    mutations
  end

  def hamming_distance(other_seq)
    return 0 if orig_sequence == other_seq
    if sequences_equal_length?(orig_sequence, other_seq)
      return hamming_equal_length(orig_sequence, other_seq)
    else
      return hamming_not_equal_length(orig_sequence, other_seq)
    end
  end
end


# very elegant solution below:

# class DNA
#   def initialize(strand1)
#     @strand1 = strand1
#   end

#   def hamming_distance(strand2)
#     count = 0
#     strand2 = strand2.chars
#     @strand1.chars[0...strand2.size].each_with_index do |item, idx|
#       count += 1 if item != strand2[idx]
#     end
#     count
#   end
# end