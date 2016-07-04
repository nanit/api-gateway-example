require 'json'
run Proc.new { |env|
  ['200', {'Content-Type' => 'application/json'},
   [{service: ENV["SERVICE_NAME"],
     path: env["REQUEST_URI"].match(/http:\/\/[^\/]+(.*)$/)[1]}.to_json]]
}
