require 'csv'
require 'pry'

class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to',
    'were', 'will', 'with']

  def initialize(filename)
    @word_array = File.read(filename).downcase.gsub(/[^a-z0-9\s]/i, '').split(' ')
    @word_array.delete_if {|word| STOP_WORDS.include?(word)}
    # wordArray.reject do |word|
    #   word == STOP_WORDS[0]
    # end
      # remove "stop words" -- words used so frequently they are ignored
      # print @word_array[0..50]
      # binding.pry
  end



# Is this the related to test_freq_of_a_word on line 9?
# go through the file word by word and keep a count of how often each word is used
  def frequency(word)
    count = @word_array.scan(word)
    p count






    # print " \n"
    # print @word_array[0..50]
    #
    # counts = Hash.new 0
    # @word_array.each do |word|
    #   counts[word] += 1
    #   counts
    # end
    # print counts
    # create hash with word => frequencies
  end


# In test file - line 24
  def frequencies
  end

# In test file - line 31
  def top_words(number)
  end

# Is this the related to test_report on line 45?
  def print_report
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
