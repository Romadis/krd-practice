require "rack"
require "./product"

class App
  def call(env)
    req = Rack::Request.new(env)

    params = req.query_string.split("&").map { |pair| pair.split("=") }.to_h

    router(req.path, req.query_string)
  end

  def router(path, params)
    case path
    when "/"
      [ 200, { "Content-Type" => "text/html" }, ["Hello, world"] ]
    when "/user"
      [ 200, { "Content-Type" => "text/html" }, ["Hello, user"] ]
    when "/product"
      result = product_controller(params)
      [ 200, { "Content-Type" => "text/html" }, [result] ]
    when "/about"
      [ 200, { "Content-Type" => "text/html" }, File.readlines('./index.html') ]
    else
      [ 404, { "Content-Type" => "text/html" }, ["404"] ]
    end
  end
  
  def product_controller(params)
    product = Product.new(params["title"], 1, 1, 1)
  
    case params["method"]
    when "calc_overall_weight"
      product.calc_overall_weight
    when "set_quantity"
      product.set_quantity(params["quantity"])
    else
      product.output
    end
  end
end