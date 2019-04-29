require 'http' 

system "clear" 

in_progress = true 

while in_progress
  system "clear" 
  puts "Dictionary, so you can get smarter" 
  puts "=" * 60 
  puts "" 

  puts "Enter a word you want to know." 
  input_word = gets.chomp 

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=10&includeRelated=false&useCanonical=false&includeTags=false&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

  definitions = response.parse 

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

  top_example = response.parse["text"]

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=5&typeFormat=IPA&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

  pronunciations = response.parse

  puts "" 
  puts " DEFINITIONS" 
  puts "=" * 60 
  puts "" 

  count = 1 

  definitions.each do |def_hash| 
    puts "  #{count.to_s.rjust(3)}. #{def_hash['text']}."
    count += 1 
  end 

  puts ""
  puts "  TOP EXAMPLE"
  puts "=" * 60
  puts ""

  puts top_example

  puts ""
  puts "  PRONOUNCIATIONS"
  puts "=" * 60
  puts ""

  count = 1 
  pronunciations.each do |pronounce_hash| 
    puts "  •#{pronounce_hash['raw']}"
  end 

  puts "" 
  puts "Press enter to continue or 'q' to quit" 
  ending_input = gets.chomp 
  if ending_input == 'q' 
    in_progress = false 
  end 

end 

system "clear" 
puts "" 
puts "*~~* BYE FELICIA *~~*" 