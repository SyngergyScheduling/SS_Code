rr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
days = []
check = {}

arr << nil unless arr.size % 2 == 0

# actual algorithm
# Should run in O(n^2). Not sure how tight that is yet
# Post test loop
first = arr[0]
loop do |i|
  day_sched = [] # schedule for a day
  (arr.size / 2.0).floor.times do |i|
    day_sched << [arr[i], arr[-(i+1)]]
    # produce histogram of generated pairings
    value = "#{arr[i]}, #{arr[-(i+1)]}"
    check[value] = 0 if check[value].nil?
    check[value] += 1
  end
  days << day_sched
  # don't move the last index
  arr.insert(0, arr.delete_at(arr.size - 2))
  break if arr[0] == first
end

# Check things
repeats = false
check.each do |key, value|
  if value != 1
    puts "#{key}, #{value}"
    no_repeates = true
  end
end
puts "produced #{check.size} pairings"

puts "No repeats" unless repeats

days.each_with_index do |ds, i|
  puts "day #{i}: #{ds}"
end
