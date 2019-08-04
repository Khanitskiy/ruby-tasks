class Array

  def rebuild!
    size = self.count
    self.each_with_index do |n, i|
      self[i] = n.map { |el| yield(*get_params(el)) } if n.class == Array
      self[i] = yield(*get_params(n))                 if n.class == Integer
    end
    self
  end

  private

  def get_params(el)
    self.count == 1 ? el : [el, self.count]
  end
end
