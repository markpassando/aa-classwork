@benches.each do |bench|
  json.set! bench.id do
    json.extract! bench, :id, :description, :lat, :long
  end
end
