require 'spec_helper'

describe ArithPuzzle::Case do
  [ 
    "\n\na",
    "+x"
  ].each do |operators|
    it "should raise InvalidOperator" do
      begin
        ArithPuzzle::Case.new("1=2", operators)
      rescue StandardError => e
        e.class.should == ArithPuzzle::Case::InvalidOperator
      end
    end
  end
  
  [ 
    "\n",
    "\n\n",
    "    ",
    ""
  ].each do |operators|
    it "should raise NoOperator" do
      begin
        ArithPuzzle::Case.new("1=2", operators)
      rescue StandardError => e
        e.class.should == ArithPuzzle::Case::NoOperator
      end
    end
  end
  
  {
    "=" => ArithPuzzle::Case::EquationError,
    "1=" => ArithPuzzle::Case::RightPartMissing,
    "=23" => ArithPuzzle::Case::LeftPartMissing,
    "1=2=3" => ArithPuzzle::Case::EquationError,
    "ab" => ArithPuzzle::Case::InvalidCharacter,
    "a=b" => ArithPuzzle::Case::InvalidCharacter,
    '123456=98765' => ArithPuzzle::Case::MoreThanTenDigits
  }.each do |equation, exception_class|
    it "equation '#{equation}' should raise '#{exception_class}'" do
      begin
        ArithPuzzle::Case.new(equation, '*')
      rescue StandardError => e
        e.class.should == exception_class
      end
    end
  end
  
  {
    "957=52" => ['957','52'],
    "    123 =  \n    456" => ['123', '456'],
    "1 3 \n    5=64 2\n    " => ['135', '642']
  }.each do |equation, left_right|
    it "shoud normalize and parse equation to left_part and right_part correctly" do
      c = ArithPuzzle::Case.new(equation, "/")
      [c.left_part, c.right_part].should == left_right
    end
  end
  
  { 
    "        + + - *" => '++-*',
    "    / / +\n\n" => '//+'
  }.each do |input, output|
    it "should normalize operators" do
      ArithPuzzle::Case.new("1=2", input).operators.should == output
    end
  end  
end