#!/usr/bin/env ruby
file = ARGV[0]

module DTK
  require 'z3'
  class Z3
    def self.read_and_return_statements(file)
      ret = []
      open_parens_diff = 0
      statement        = ''
      File.open(file).each_line do |line|
        statement << line
        diffs = line.scan('(').size - line.scan(')').size
        open_parens_diff += diffs
        if open_parens_diff == 0
          ret << statement
          statement = ''

        elsif open_parens_diff > 0
          # next line wil be included
        else
          fail "Unexected that open_parens_diff (#{open_parens_diff}) is < 0"
        end
      end
      ret
    end

    def self.process(statement)
      begin 
        ::Z3::LowLevel.eval_smtlib2_string(statement)
      rescue => e
        STDOUT << "Error for:\n  #{statement}"
        fail e
      end
    end
  end
end

DTK::Z3.read_and_return_statements(file).each do |statement|
  STDOUT << DTK::Z3.process(statement)
end
