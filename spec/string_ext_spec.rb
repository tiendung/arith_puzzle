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
end