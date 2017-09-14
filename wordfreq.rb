require 'csv'
require 'pry'

class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on','she', 'that', 'the', 'to',
    'were', 'will', 'with']

  def initialize(filename)
    @word_array = File.read(filename).downcase.gsub(/[^a-z0-9\s]/i, ' ').split(' ')
    @word_array.delete_if {|word| STOP_WORDS.include?(word)}
    @frequencies_hash = Hash.new 0
      @word_array.each do |element|
          @frequencies_hash[element] += 1
        end
    @array_for_sorted_hash = @frequencies_hash.sort_by{|k,v| [-v, k] }
  end

  def frequency(word)
    @word_array.count(word)
  end

  def frequencies
      @frequencies_hash
  end

  def top_words(number)
    @array_for_sorted_hash[0..(number-1)]
  end

  def print_report
    @array_for_sorted_hash[0..10].each do |key, value|
      [-value, key]
      stars = "*" * value
      holder = (" " * (8 - key.length))
      string = ("#{key.rjust(7)} | #{value.to_s.ljust(2)} "+ stars + "\n")
      print string
    end
  end
end

if __FILE__ == $0
  filename = ARGV[0]
  if filename
    full_filename = File.absolute_path(filename)
    if File.exists?(full_filename)
      wf = Wordfreq.new(full_filename)
      wf.print_report
    else
      puts "#{filename} does not exist!"
    end
  else
    puts "Please give a filename as an argument."
  end
end
