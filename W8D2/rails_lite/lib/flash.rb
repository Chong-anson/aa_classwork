require 'json'

class Flash
    def initialize(req)
    # debugger
    @cookies = {} 
    @new_cookies = {} 
    if req.cookies["_rails_lite_app_flash"]
        @cookies = JSON.parse(req.cookies["_rails_lite_app_flash"]) 
    end 

    end 

    def []=(key,val)
        @new_cookies[key] = val
        @cookies[key] = val
    end

    def [](key)
        @cookies[key.to_s]
    end

    def store_flash(res)
        # debugger
        res.set_cookie("_rails_lite_app_flash", JSON.generate(@new_cookies))
    end

    def now
        @cookies
    end

end

# if @cookies
#     @count.each do | key, value | 
#         unless value >= 1
#             @final_cookies[key] = @cookies[key]
#             @count[key] += 1
#         end 
#     end 
# end 