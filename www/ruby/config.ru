app = proc do |env|
    [200, { "Content-Type" => "text/html" }, ["Hello Ruby app"]]
end
run app

