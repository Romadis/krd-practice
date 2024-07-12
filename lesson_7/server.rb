require "socket"
require "./app"

# def router(path, params)
#  case path
#  when "/"
#    "Hello, world!"
#  when "/user"
#    "Hello, user"
#  when "/product"
#    product_controller(params)
#  else
#    "404"
#  end
#end
#
#def product_controller(params)
#  product = Product.new(params["title"], 1, 1, 1)
#
#  case params["method"]
#  when "calc_overall_weight"
#    product.calc_overall_weight
#  when "set_quantity"
#    product.set_quantity(params["quantity"])
#  else
#    product.output
#  end
#end

app = App.new

server = TCPServer.open('0.0.0.0', 3000)

while connection = server.accept
  request = connection.gets #
  
  method, full_path = request.split(" ")

  path, params = full_path.split("?")

  status, headers, body = app.call({
    "REQUEST_METHOD" => method,
    "PATH_INFO" => path,
    "QUERY_STRING" => params
  })

  connection.print "HTTP/1.1 #{status}\r\n"
  headers.each do |key, value|
    connection.print "#{key}:#{value}\r\n"
  end
  connection.print "\r\n"

  body.each do |part|
    connection.print part
  end
  
  connection.close
end
