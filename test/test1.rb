#!/usr/bin/env ruby
require 'z3'
file = ARGV[0]
File.open(file).each_line do |line|
  STDOUT << ::Z3::LowLevel.eval_smtlib2_string(line)
end
