#!/usr/bin/env ruby
file = ARGV[0]

module DTK
  require 'z3'
  class Z3
    def self.read_and_return_statements(file)
      ret = []
      open_parens = 0
      statement  = ''
      File.open(file).each_line do |line|
        unless line =~ /^;/
          if open_parens > 0 and not (line =~ /^ /)
            fail "statement:\n  #{statement}\n is not closed but next line (#{line}) does not start with an indent"
          end

          statement << line

          paren_diffs = line.scan('(').size - line.scan(')').size
          open_parens += paren_diffs
          if open_parens == 0
            ret << statement
            statement = ''
          elsif open_parens > 0
            # nothing else needs to be done; statement << line has been done in above line
          else
            fail "Unexected that open_parens (#{open_parens}) is < 0"
          end
        end
      end
      if open_parens > 0
        fail "Last statement\n #{statement}\n was not closed and end of file has been reached"
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
