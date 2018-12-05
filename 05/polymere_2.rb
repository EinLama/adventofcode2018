 #(97..122).include? a.ord #lowercase

def polarity?(a, b=nil)
  return false unless b # guard for first call

  (a.ord - b.ord).abs == 32 # same letter, opposing case
end

def process_char(c, current_str)
  if polarity?(c, current_str.last)
    # polarity found, removing
    return current_str.take(current_str.size - 1)
  else
    return current_str + [c]
  end
end

def create_pair(chr)
  [chr.downcase, chr.upcase]
end

def iterate(input)
  current_str = []
  input.each do |c|
    current_str = process_char(c, current_str)
  end
  current_str
end

def polymere()
  pairs = []
  (?a..?z).each do |c|
    pairs << create_pair(c)
  end

  input = File.read("input05").chomp.split("")

  lowest_score = 100_000

  pairs.each do |pair|
    input_without_pair = input.reject {|c| pair.include?(c) }
    current_str = iterate(input_without_pair)

    lowest_score = [current_str.size, lowest_score].min
  end

  lowest_score
end

puts polymere()