module Testrus
  class Runner
    attr_reader :command

    def initialize(command)
      @command = command
    end
    
    def run(input)
      %x[echo '#{input}' | #{command}]
    end
  end
end
