#!/usr/bin/ruby
require 'rubygems'
require 'hpricot'
require 'active_support'
require 'permutation'
require 'lib/string_ext'
require 'lib/case'

module ArithPuzzle
  def self.process_cases_from_stream(stream)
    doc = Hpricot(stream)
    cases = doc.search('.case').map do |case_element|      
      ArithPuzzle::Case.new(
        :case_id    => case_element[:id],
        :equation   => case_element.search('.equation').first.html,
        :operators  => case_element.search('.operators').first.html
      )
    end
    cases.sort_by{ |c| c.case_id }.join
  end
end

unless ENV['_'] =~ /spec/
  puts ArithPuzzle.process_cases_from_stream(File.open('sample.html'))
end