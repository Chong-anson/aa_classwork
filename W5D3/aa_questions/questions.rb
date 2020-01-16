require_relative 'questions_db'
require_relative 'replies'
require_relative 'question_follows'
require_relative 'question_likes'

class Question 

  attr_accessor :id, :title, :body, :author_id, :author

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map {|el| Question.new(el)}
  end

  def initialize(options)
      @id = options['id']
      @title = options['title']
      @body = options['body']
      @author_id = options['author_id']
      @author = options['author']
  end


  def self.find_by_id(target_id) 
    # result will be an array
    result = QuestionsDatabase.instance.execute(<<-SQL, target_id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    # get the only element from the array
    return !result.empty? ? Question.new(result.first) : nil
  end 
  
  def self.find_by_author_id(author_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT 
        *
      FROM 
        questions
      WHERE 
        author_id = ? 
    SQL
    return !result.empty? ? Question.new(result.first) : nil
  end
  
  def replies
    Reply.find_by_question_id(self.id)
  end 

  def followers
    QuestionFollow.followers_for_question_id(self.id) 
  end 
  
  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def likers
    QuestionLike.likers_for_question_iq(self.id)
  end

  def num_likers
    QuestionLike.num_likes_for_question_id(self.id)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

end 