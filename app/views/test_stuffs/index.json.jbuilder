json.array!(@test_stuffs) do |test_stuff|
  json.extract! test_stuff, :id, :duration
  json.url test_stuff_url(test_stuff, format: :json)
end
