class Question < ApplicationRecord
  has_many :question_contents, dependent: :destroy
  has_many :answer_results, dependent: :destroy
  belongs_to :admin
end
