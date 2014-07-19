app = proc do |env|
    [200, { "Content-Type" => "text/html" }, ["hello <b>ruby app</b>"]]
end
run app