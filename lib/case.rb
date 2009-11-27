module ArithPuzzle
  class Case
    class EquationError < StandardError; end
    class LeftPartMissing < EquationError; end
    class RightPartMissing < EquationError; end
    class InvalidCharacter < EquationError; end
    class MoreThanTenDigits < EquationError; end
    class OperatorError < StandardError; end
    class InvalidOperator < OperatorError; end
    class NoOperator < OperatorError; end
    class TooManyOperators < OperatorError; end
      
    attr_reader :left_part, :right_part, :operators

    def initialize(equation, operators)
      @operators = operators.remove_blanks      
      raise InvalidOperator if @operators =~ /[^\+\-\*\/]/
      raise NoOperator if @operators.blank?

      @equation = equation.remove_blanks

      raise InvalidCharacter if @equation =~ /[^\d=]/
      parts = @equation.split('=')
      raise EquationError if parts.length > 2 or parts.length == 0
      raise LeftPartMissing if parts.first.blank?
      raise RightPartMissing if parts.last.blank?
      raise MoreThanTenDigits if @equation.size > 11
      
      @left_part = parts.first
      @right_part = parts.last
      @slot_size = @left_part.size + @right_part.size - 2
      
      raise TooManyOperators if @slot_size < @operators.size
    end
    
    def build_solution(combination)
      left_combination = combination[0..@left_part.size-2]
      right_combination = combination[@left_part.size-1..-1]

      [ @left_part.build_part(@operators, left_combination),
        '=',
        @right_part.build_part(@operators, right_combination)
      ].join
    end
    
    def first_solution
      Permutation.new(@slot_size).each do |permutation|
        solution = build_solution(permutation.value)
        begin
          return solution if eval(solution.sub('=','=='))
        rescue
          # Skip divided by zero exception
        end
      end
      return "NO SOLUTION"
    end
  end
end