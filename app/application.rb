require 'pry'
class Application
    @@item = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match (/items/)
          items_price = req.path.split("/items/").last.price
          resp.write items_price
        else
          resp.write "Route not found"
          resp.status = 404
        end
    
        resp.finish
      end
    

end
