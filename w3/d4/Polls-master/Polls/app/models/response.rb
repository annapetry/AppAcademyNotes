class Response < ActiveRecord::Base
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validate :respondent_has_not_already_answered_question
  validate :respondent_is_not_the_author

  belongs_to(
    :respondent,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )
  belongs_to(
    :answer_choice,
    class_name: "AnswerChoice",
    foreign_key: :answer_choice_id,
    primary_key: :id
  )
  
  has_one(
    :question,
    through: :answer_choice,
    source: :question  
  )

  has_one(
    :poll,
    through: :answer_choice,
    # through: :question,
    source: :poll
  )
  
  def sibling_responses
    val = self.id || 0
    question.responses
      .where("responses.id != ?", val)
  end
  
  def respondent_has_not_already_answered_question
    if !sibling_responses.none? { |response| response.user_id == self.user_id }
      self.errors[:user_id] << "Respondent cannot have multiple answers to the same question!"
      return false
    else
      return true
    end
  end    
  
  def respondent_is_not_the_author
  
    if self.poll.author_id == self.user_id
      self.errors[:user_id] << "Poll creater cannot answer questions!"
      return false
    else
      return true
    end

  end
  
end
