require 'json'

file = File.read("quiz.json")
data_hash = JSON.parse(file)

data_hash.each do |question|
  question_id = question["id"]
  puts question_id
end