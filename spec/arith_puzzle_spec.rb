require 'spec_helper'

describe ArithPuzzle do
  it "should return correct output for sample input" do
    output = ArithPuzzle.process_cases_from_stream(File.open('sample.html'))
    output.should == <<-EOS
Case abc: 9*5+7=52
Case def: 1*2+3=4-5+6
Case ghi: 1+3*5=6+4*2
Case jkl: NO SOLUTION
Case mno: 8+9/16=9/5
EOS
  end

  it "should have more specs"
end

