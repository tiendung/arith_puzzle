module ArithPuzzle
  class Case
    def initialize(equation, operators)
      parts = equation.remove_blanks.split('=')
      @left_part = parts.first
      @righ_part = parts.last
      @operators = operators.remove_blanks
    end
  end
end