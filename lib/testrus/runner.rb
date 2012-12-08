module Testrus
  class Runner
    attr_reader :command

    # Responsible for running the actual test against a given command (program)
    # a run object about the execution of the program against the given input.
    #
    # command - The String command to pass the input to
    #
    def initialize(command)
      @command = command
    end
    
    # Public: Returns an object with the results of running the program against
    # the input.
    #
    # input - The String of input to pass to the program
    #
    # Returns a Runner::Run object with information about the run.
    def run(input)
      %x[echo '#{input}' | #{command}]
    end
  end
end
