require 'rack'
require 'byebug'

app = Proc.new do | env | 
    req = Rack::Request.new(env)
    res = Rack::Response.new
    res['Content-type'] = "text/html"
    res.write(req.path)
    debugger
    res.finish
end 

Rack::Server.start( 
    app: app,
    Port: 3000
)