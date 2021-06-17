# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'json'

Question.delete_all

file = File.read("quiz.json")
data_hash = JSON.parse(file)

data_hash.each do |data|
  Question.create(question_id: data["id"], question: data["question"], description: data["description"],  answer_a: data["answers"]["answer_a"], answer_b: data["answers"]["answer_b"], answer_c: data["answers"]["answer_c"], answer_d: data["answers"]["answer_d"], answer_e: data["answers"]["answer_e"], answer_f: data["answers"]["answer_f"], multiple_correct_answers: data["multiple_correct_answers"], answer_a_correct: data["correct_answers"]["answer_a_correct"], answer_b_correct: data["correct_answers"]["answer_b_correct"], answer_c_correct: data["correct_answers"]["answer_c_correct"], answer_d_correct: data["correct_answers"]["answer_d_correct"], answer_e_correct: data["correct_answers"]["answer_e_correct"], answer_f_correct: data["correct_answers"]["answer_f_correct"], category: data["category"], difficulty: data["difficulty"])
end