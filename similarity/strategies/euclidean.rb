module Strategies
  class Euclidean

    def get_similarity(dataset, entity1, entity2)
      e1, e2 = dataset[entity1], dataset[entity2] #get dataset slices for each entity
      shared_items = e1.keys.reject{|k| e2[k].nil?}# get the shared items
      return 0 if shared_items.size == 0
      
      sum_of_squares = shared_items.inject(0.0){|n, i| n += (e1[i] - e2[i]) ** 2} #sum the squares of differences
      1 / (1 + sum_of_squares) # return the inverted sum 
    end

  end
end
