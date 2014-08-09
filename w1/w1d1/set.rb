class myHashSet
  
  def initialize
    @store = {}
  end
  
  def insert(el)
    @store[el] = true
  end
  
  def include?(el)
    @store.each do |k, v|
      if k == el
        return true
      else
        false
      end
    end
  end
  
  def delete(el)
    if @store.include?(el)
      @store.delete('el')
      return true
    else
      return false
    end
  end
  
  def to_a
    @store.keys 
  end
  
  def union(set2)
    (self.merge(set2)).merge(self)
  end
  
  def intersect(set2)
    result = {}
    self.each do |x, y|
      result[x] if set2.keys.include? x
    end
  end
  
  def minus(set2)
    result = {}
    self.each do |x, y|
      result[x] if set2.keys.!include? x
    end
  end
end
