#!/usr/bin/env ruby
require 'z3'
file = ARGV[0]
File.open(file).each_line do |line|
  begin 
    STDOUT << ::Z3::LowLevel.eval_smtlib2_string(line)
  rescue => e
    STDOUT << "Error for:\n  #{line}"
    fail e
  end
end
