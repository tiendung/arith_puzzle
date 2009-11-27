class String
  def remove_blanks
    self.gsub(/\s/, '')
  end
  
  def build_part(operators, comb)
    str = ''
    (0..self.size - 2).each do |i|
      str << self[i]
      ci = comb[i]
      if ci < operators.size
        str << operators[ci]
      end
    end
    str << self[self.size - 1]
  end
end