require 'active_record'

class Word < ActiveRecord::Base
end

ActiveRecord::Base.establish_connection({:adapter => "postgresql", :host => "localhost", :username => "peterhahn", :database => "anagram"})

	if ARGV[0].chars.sort != ARGV[1].chars.sort
		puts "Sorry, no anagrams here, dog"
	else Word.create({word: ARGV[0], word2: ARGV[1]})
	
	end







