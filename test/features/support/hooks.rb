Before do |scenario|
  puts '==> before!'
end

After do |scenario|
  sleep 10
  puts '==> after!'
end