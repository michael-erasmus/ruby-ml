(Dir[File.dirname(__FILE__) + '/strategies/*.rb']).each  {|f| load f}

class Similarity

  def initialize(dataset={},strategy)
    @strategy = strategy
    @dataset = dataset 
  end

  def self.euclidean(dataset)
    Similarity.new(dataset, Strategies::Euclidean.new)
  end


  def self.pearson(dataset)
    Similarity.new(dataset, Strategies::Pearson.new)
  end

  def between(entity1, entity2)
    @strategy.get_similarity(@dataset, entity1, entity2)
  end

end
