require "set"

def one_xtra()
  frequency = 0
  results = Set.new
  all_frequencies = File.open("input01").map { |f| f.to_i }

  all_frequencies.cycle do |f|
    frequency += f

    return frequency if results.include?(frequency)
    results << frequency
  end

  nil
end

def two()
  twos = 0
  threes = 0

  File.open("input02").each do |l|
    counts = l.split("").inject(Hash.new(0)) { |h,c| h[c] += 1; h }
    twos += 1 if counts.any? {|k,v| v == 2}
    threes += 1 if counts.any? {|k,v| v == 3}
  end

  twos * threes
end


found = two()
puts "RESULT: #{found}"
