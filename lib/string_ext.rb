class String
  def remove_blanks
    self.gsub(/\s/, '')
  end
  
  def build_part(operators, combination)
    str = ''
    (0..self.size - 2).each do |i|
      str << self[i]
      if combination[i] < operators.size
        str << operators[combination[i]]
      end
    end
    str << self[self.size - 1]
  end
end