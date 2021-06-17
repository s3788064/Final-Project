class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :question_id
      t.string :question
      t.string :description
      t.string :answer_a
      t.string :answer_b
      t.string :answer_c
      t.string :answer_d
      t.string :answer_e
      t.string :answer_f
      t.string :multiple_correct_answers
      t.string :answer_a_correct
      t.string :answer_b_correct
      t.string :answer_c_correct
      t.string :answer_d_correct
      t.string :answer_e_correct
      t.string :answer_f_correct
      t.string :category
      t.string :difficulty

      t.timestamps
    end
  end
end
