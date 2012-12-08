module Testrus
  class Runner
    attr_reader :command

    # Internal: Specifies the log file.
    LOG_FILE = "/tmp/testrus"

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
    def run(test)
      system "echo '#{test.input}' | /usr/bin/time -l #{full_command} &> #{LOG_FILE}"
      Run.new File.read(LOG_FILE), test
    end

    private
    # Internal: Returns the full command, where the script is prefixed with its
    # full path. All options are passed along.
    def full_command
      parts = command.split(" ")
      "#{parts[0..-2].join(" ")} #{`pwd`.strip}/#{parts.last}"
    end
  end
end
