module ArithPuzzle
  class Case
    class EquationError < StandardError
    end
    
  	class LeftPartMissing < EquationError
  	end

  	class RightPartMissing < EquationError
  	end
  	
  	class InvalidCharacter < EquationError
	  end
	  
	  class MoreThanTenDigits < EquationError
    end
    
    class OperatorError < StandardError
    end
    
    class InvalidOperator < OperatorError
    end
    
    class NoOperator < OperatorError
    end

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
    end
    
    
    def solutions
    end
  end
end