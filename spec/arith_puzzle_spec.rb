require 'spec_helper'

describe ArithPuzzle do
  it "should return correct output for sample input" do
    output = ArithPuzzle.process_cases_from_stream(File.open('sample.html'))
    output.should == <<-EOS
Case abc: 9*5+7=52
Case def: 1*2+3=4-5+6
Case ghi: NO SOLUTION
Case jkl: NO SOLUTION
Case mno: 89/1/6=9+5
EOS
  end

  it "should have more specs"
end

