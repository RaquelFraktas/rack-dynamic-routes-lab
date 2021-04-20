require 'pry'
class Application
    @@items = [Item.new("banana", 3), Item.new("apple", 1), Item.new("dyson", 700)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
#your application should only accept the items --
#hard code in item array to give it data

        if req.path.match (/items/)
            
          item_name = req.path.split("/items/").last
           if found =  @@items.find { |item| item.name == item_name}
                # binding.pry
                 resp.write found.price
           else
            resp.write "Item not found"
            resp.status = 400
            end

          
        else
          resp.write "Route not found"
          resp.status = 404
        end
    
        resp.finish
      end
    

end
