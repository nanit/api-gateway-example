require 'json'
run Proc.new do |env|
  ['200', {'Content-Type' => 'application/json'},
   [{service: env["HTTP_X_SERVICE"],
     path: env["REQUEST_URI"].match(/http:\/\/[^\/]+(.*)$/)[1]}.to_json]]
end
