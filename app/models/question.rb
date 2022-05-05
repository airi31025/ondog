class Question < ApplicationRecord
  belongs_to :admin
  has_many :answer_results, dependent: :destroy
  has_many :question_contents, dependent: :destroy
end
