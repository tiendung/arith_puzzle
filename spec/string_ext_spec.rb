require 'spec_helper'

describe String do
  {
    " a  b  c \n  \t  " => 'abc',
    "+ \n*" => '+*',
    "    123 =  \n    456" => '123=456'
    
  }.each do |input, output|
    it "'#{input}'.remove_blanks should equal '#{output}'" do
      input.remove_blanks.should == output
    end
  end
  
  it "should build_part correctly" do
    "abcd".build_part('+-',[0, 1, 2]).should == "a+b-cd"
    "abcd".build_part('+-',[2, 0, 1]).should == "ab+c-d"
    "abcd".build_part('+-',[1, 2, 0]).should == "a-bc+d"
  end
end