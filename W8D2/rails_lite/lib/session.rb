require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    # @req = req 
    # debugger
    cookie_string = req.cookies["_rails_lite_app"]
    if cookie_string
      @cookie_hash = JSON.parse(cookie_string)
    else 
      @cookie_hash = {}
    end 

    # debugger
  end

  def [](key)
    @cookie_hash[key]
  end

  def []=(key, val)
    # debugger
    @cookie_hash[key] = val
  end 

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie("_rails_lite_app", JSON.generate(@cookie_hash))
  end
end
