module Strategies
  class Pearson 

    def get_similarity(dataset, entity1, entity2)
      e1, e2 = dataset[entity1], dataset[entity2] #get dataset slices for each entity
      shared_items = e1.keys.reject{|k| e2[k].nil?}# get the shared items
      n = shared_items.size
      return 0 if n.size == 0
    
      #sum the all items
      sum1 = shared_items.inject(0.0){|n, k| n += e1[k]}
      sum2 = shared_items.inject(0.0){|n, k| n += e2[k]}
      
      #sum the squares
      sum1_square = shared_items.inject(0.0){|n, k| n += e1[k] ** 2}
      sum2_square = shared_items.inject(0.0){|n, k| n += e2[k] ** 2}

      #sum the products
      product_sum = shared_items.inject(0.0){|n,k| n += e1[k] * e2[k]}

      #calulate pearson correlation 
      num = product_sum - ((sum1 * sum2) / n)

      den = Math.sqrt( (sum1_square - (sum1 ** 2) / n) * ( sum2_square - (sum2 ** 2) / n ) )
      den==0 ? 0 : num/den
    end

  end
end
