require_relative 'questions_db'
require_relative 'users'
class QuestionLike 

  attr_accessor :id, :user_id, :question_id
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map {|el| QuestionLike.new(el)}
  end

  def initialize(options)
      @id = options['id']
      @user_id = options['user_id']
      @question_id = options['question_id']
  end


  def self.find_by_id(target_id) 
    # result will be an array
    result = QuestionsDatabase.instance.execute(<<-SQL, target_id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    # get the only element from the array
    return !result.empty? ? QuestionLike.new(result.first) : nil
  end 
  
  def self.likers_for_question_iq(question_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        users.*
      FROM 
        users
      JOIN question_likes ON question_likes.user_id = users.id 
      WHERE 
        question_likes.question_id = ?
    SQL
    result.empty? ? nil : result.map {|ele| User.new(ele)}
  end

  def self.num_likes_for_question_id(question_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      COUNT(*)
    FROM
      question_likes
    WHERE
      question_likes.question_id = ?
    GROUP BY
      question_likes.question_id
    SQL
    result.empty? ? nil : result.first
  end

  def self.liked_questions_for_user_id(user_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      questions.*
    FROM
      questions
    JOIN
      question_likes ON question_likes.question_id = questions.id
    WHERE
      question_likes.user_id = ?
    SQL
    !result.empty? ? result.map {|ele| Question.new(ele)} : nil
  end

  def self.most_liked_questions(n)
    result = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT
      questions.*
    FROM
      questions
    JOIN
      question_likes ON question_likes.question_id = questions.id
    GROUP BY
      questions.id
    ORDER BY
      COUNT(question_likes.user_id) DESC
    LIMIT
      n
    SQL
    !result.empty? ? result.map {|ele| Question.new(ele)} : nil
  end


end 