
def anagrams (string1, string2)
	if string1.chars.sort == string2.chars.sort
		"Anagrams confirmed!"
	else "Sorry, no anagrams here, dog"
	end
end

puts anagrams("silent", "listen")
