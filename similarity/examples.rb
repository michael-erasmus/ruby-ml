require './critics'
require './similarity'

similarity = Similarity.pearson($critics)
puts "The top matches for Lisa Rose:"

similarity.top("Lisa Rose").each {|m| puts m}
