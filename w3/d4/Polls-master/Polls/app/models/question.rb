class Question < ActiveRecord::Base
  validates :text, presence: true
  validates :poll_id, presence: true
  
  belongs_to(
    :poll,
    class_name: "Poll",
    foreign_key: :poll_id,
    primary_key: :id
  )
  has_many(
    :answer_choices,
    class_name: "AnswerChoice",
    foreign_key: :question_id,
    primary_key: :id
  )
  
  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )
  
  # def results
  #   result = {}
  #   answer_choices.includes(:responses).map do |choice|
  #     result[choice.choice] = choice.responses.length
  #   end
  #   result
  # end
  
  def results
    results = {}
    self.answer_choices
      .select("answer_choices.*, COUNT(responses.*) AS response_total")
      .joins(<<-SQL)
        LEFT OUTER JOIN 
          responses 
        ON 
          answer_choices.id = responses.answer_choice_id
        SQL
      .group("answer_choices.id")
    .map do |choice| 
      results[choice.choice] = choice.response_total
    end
    results
  end
  
  
#
# AnswerChoice.find_by_sql(<<-SQL)
# SELECT
#   answer_choices.*, COUNT(responses.*) AS response_total
# FROM
#   answer_choices
# LEFT OUTER JOIN
#   responses
# ON
#   answer_choices.id = responses.answer_choice_id
# GROUP BY
#   answer_choices.id
#   SQL
  
  
  
end
