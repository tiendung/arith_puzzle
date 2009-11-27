#!/usr/bin/ruby
require 'rubygems'
require 'hpricot'
require 'active_support'
require 'permutation'
require 'lib/string_ext'
require 'lib/case'

module ArithPuzzle
  def self.process_cases_from_stream(stream)
    # finishme
  end

  # ...

end

unless ENV['_'] =~ /spec/
  puts ArithPuzzle.process_cases_from_stream(File.open('sample.html'))
end