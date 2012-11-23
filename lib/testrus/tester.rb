module Testrus
  class Tester
    # Internal: Defines the relationship between input sources and their
    # corresponding class names.
    SOURCES = {
      :file => Testrus::Input::File
    }

    # Public: Initializes a tester object. The tester is responsible for
    # coordinating the input from the input source and the runner, and passing
    # the final results to the formatter.
    #
    # options - The Hash containing the options for the Tester:
    #           :source  - The Symbol marking the input source, valid options
    #           are defined in the class constant Tester::SOURCES.
    #           :command - The String specifying the command to run program that
    #           the the input will be given to via STDIN.
    #
    def initialize(options)
      @options = options
    end

    # Public: Maps the human source to the class that is responsible for the
    # given source.
    #
    # Returns a corresponding Class constant.
    def source
      @source ||= SOURCES[@options[:source]].new
    end

    # Public: Returns the instance of the runner which is responsible for
    # running the program against the input.
    def runner
      @runner ||= Testrus::Runner.new(options[:command])
    end
  end
end
