require_relative 'questions_db'
require_relative 'users'
require_relative 'questions'

class Reply 

  attr_accessor :id, :body, :questions_id, :user_id,  :reply_follow

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map {|el| Reply.new(el)}
  end

  def initialize(options)
      @id = options['id']
      @body = options['body']
      @questions_id = options['questions_id']
      @user_id = options['user_id']
      @reply_follow = options['reply_follow']

  end


  def self.find_by_id(target_id) 
    # result will be an array
    result = QuestionsDatabase.instance.execute(<<-SQL, target_id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    # get the only element from the array
    return !result.empty? ? Reply.new(result.first) : nil
  end 

  def self.find_by_user_id(user_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ? 
    SQL
    # get the only element from the array
    return !result.empty? ? Reply.new(result.first) : nil
  end 
  
  def self.find_by_question_id(question_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ? 
    SQL
    # get the only element from the array
    return !result.empty? ? Reply.new(result.first) : nil
  end 

  def author
    User.find_by_id(self.user_id)
  end
  
  def question 
    Question.find_by_id(self.question_id)
  end

  def parent_reply
    Reply.find_by_id(self.reply_follow)
  end

  def child_replies
    result = QuestionsDatabase.instance.execute(<<-SQL, self.id)
    SELECT
      *
    FROM
      replies
    WHERE
      reply_follow = ?
    SQL
    return !result.empty? ? result.map {|el| Reply.new(el)}  : nil
  end

end 