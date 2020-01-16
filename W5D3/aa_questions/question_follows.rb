require_relative 'questions_db'
require_relative 'users'
require_relative 'questions'

class QuestionFollow 

  attr_reader :id, :user_id, :question_id
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map {|el| QuestionFollow.new(el)}
  end

  def initialize(options)
      @id = options['id']
      @question_id = options['question_id']
      @user_id = options['user_id']
  end


  def self.find_by_id(target_id) 
    # result will be an array
    result = QuestionsDatabase.instance.execute(<<-SQL, target_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    # get the only element from the array
    return !result.empty? ? QuestionFollow.new(result.first) : nil
  end 
  
  def self.followers_for_question_id(question_id) 
    result = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        users.*
      FROM 
        users 
      JOIN  
        question_follows ON question_follows.user_id = users.id
      WHERE 
        question_follows.question_id = ?
    SQL
    return !result.empty? ? result.map {|ele| User.new(ele)} : nil
  end

  def self.followed_questions_for_user_id(user_id) 
    result = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        questions.*
      FROM 
        questions 
      JOIN  
        question_follows ON question_follows.question_id = questions.id
      WHERE 
        question_follows.user_id = ?
    SQL
    return !result.empty? ? result.map {|ele| Question.new(ele)} : nil
  
  end 
  
  def self.most_followed_questions(n) 
    result = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT 
        questions.* 
      FROM 
        questions 
      JOIN  
        question_follows ON question_follows.question_id = questions.id
      GROUP BY 
        question_follows.question_id
      ORDER BY 
        COUNT(question_follows.user_id) DESC
      LIMIT 
        ?
    SQL
    !result.empty? ? result.map {|ele| Question.new(ele)} : nil
  end 

end 