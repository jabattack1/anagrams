# Write a simple web application that displays all your anagrams 
# and lets you add more through a form (but only if they're actually anagrams!) (Use ActiveRecord)
require 'sinatra'
require 'pry'
require 'active_record'
require 'mustache'


class Word < ActiveRecord::Base
end

ActiveRecord::Base.establish_connection({:adapter => "postgresql", :host => "localhost", :username => "peterhahn", :database => "anagram"})

get '/' do
	html = File.read('./anagram.html')
  data = Word.all.to_a
  Mustache.render(File.read('./anagram.html'), {word: data[0]["word"], word2: data[0]["word2"]})

# binding.pry
end

get '/words' do
	html = File.read('./anagram2.html') 
end

post '/words' do
	word = params["word"]
	word2 = params["word2"]
	if word.chars.sort != word2.chars.sort
		redirect "/"
	else Word.create({word: word, word2: word2})
	redirect "/"
	end
end
