require 'rack'
require 'byebug'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'

  message = req.path
  
  res.write(message)
  res.finish
end


Rack::Server.start(
  app: app,
  Port: 3000
)
