class User < ActiveRecord::Base
  validates :user_name, presence: true
  
  has_many(
    :authored_polls,
    class_name: "Poll",
    foreign_key: :user_id,
    primary_key: :id
  )
  has_many(
    :responses,
    class_name: "Response",
    foreign_key: :author_id,
    primary_key: :id
  )
  
  def completed_polls

    
  end
  
  def completed_polls
    polls_attended
      .having("COUNT(questions.id) = COUNT(responses.id)")
  end

  
  def polls_attended 
    Poll
      .select("polls.*, COUNT(questions.id) as total_questions_answered")
      .joins(questions: :answer_choices)
      .joins(<<-SQL)
        LEFT OUTER JOIN
        responses
        ON
        answer_choices.id = responses.answer_choice_id
        SQL
      .joins(:author)
      .where("responses.user_id = ?", self.id)
      .group("polls.id")
  end
  
  
  # OR responses.user_id IS NULL
  
  
  # def question_count(current_poll_id)
  #   Poll
  #     .select("COUNT(questions.*) AS question_count")
  #     .joins(:questions)
  #     .where("polls.id = #{current_poll_id}")
  #     .group("polls.id")
  # end
  
  # HAVING
 # COUNT(q.id) = 
 #(SELECT
 #   COUNT(qq.*) AS question_count
 #   FROM
 #   polls pp
 #   JOIN
 #   questions qq
 #   ON
 #   qq.poll_id = pp.id
 #   WHERE
 #   pp.id = ?
 #   GROUP BY
 #   pp.id)
  
  
end

##
# q_user_reponse_to_poll = <<-SQL
# SELECT
# p.*, COUNT(q.id) as total_questions_answered
# FROM
# polls p
# JOIN
# questions q
# ON
# p.id = q.poll_id
# JOIN
# answer_choices ac
# ON
# q.id = ac.question_id
# JOIN
# responses r
# ON
# ac.id = r.answer_choice_id
# JOIN
# users u
# ON
# u.id = r.user_id
# WHERE
# u.id = :user_id_in_query
# GROUP BY
# p.id
# HAVING
# COUNT(q.id) = (SELECT
#   COUNT(qq.*) AS question_count
#   FROM
#   polls pp
#   JOIN
#   questions qq
#   ON
#   qq.poll_id = pp.id
#   WHERE
#   pp.id = 1
#   GROUP BY
#   pp.id)
# SQL
# #
# a = Poll.find_by_sql([q_user_reponse_to_poll, user_id_in_query: 3])
#
#
# a = (<<-SQL)
# SELECT
#   COUNT(qq.*) AS question_count
#   FROM
#   questions qq
#   LEFT OUTER JOIN
#   polls pp
#   ON
#   qq.poll_id = pp.id
#   WHERE
#   pp.id = 2
#   GROUP BY
#   pp.id
# SQL