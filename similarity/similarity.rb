(Dir[File.dirname(__FILE__) + '/strategies/*.rb']).each  {|f| load f}

class Similarity

  def initialize(dataset={},strategy)
    @strategy = strategy
    @dataset = dataset 
  end

  def self.method_missing(method_id, *args)
    dataset = args[0]
    strategy =  Strategies.const_get(method_id.to_s.capitalize)
    Similarity.new(dataset, strategy.new)
  end

  def between(entity1, entity2)
    @strategy.get_similarity(@dataset, entity1, entity2)
  end
  def distances(entity)
    @dataset.keys.reject{|e| e == entity}.inject(Hash.new){|h, k| h[k] = between(entity, k);h}
  end
  def top(entity, n=3)
    distances(entity).sort_by{|d| d[1]}.reverse.take(n)
  end
end
