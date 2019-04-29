require 'http' 

system "clear" 
puts "Enter a word you wish to look up."
word = gets.chomp 

while word != 'q' 
  # puts "=" * 50 
  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=10&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd") 

  # examples = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  # pronounciation = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

  definition = response.parse
  example_output = examples.parse 
  # pronounc = pronounciation.parse 

  puts definition[0]['text']
  p "=" * 50 
  # puts example_output['examples'][1]['text'] 
  # p "=" * 50 
  # puts pronounc[0]['raw']
  # p "=" * 50 

  puts "Enter a word you wish to look up." 
  word = gets.chomp 
end 


# print "Enter a Word:" 
# input_word = gets.chomp 

# response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=3&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

# definitions = response.parse 

# puts "" 
# puts "   DEFINITIONS" 
# puts "=" * 60 
# puts "" 

# count = 1 

# definitions.each do |def_hash| 
#   puts "    #{count.to_s.rjust(3)}. #{def_hash['text']}" 
#   count += 1 
# end 