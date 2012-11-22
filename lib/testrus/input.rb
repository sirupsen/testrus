module Testrus
  class Input
    attr_accessor :options

    # Public: Initializes a new Input. An Input is the standard object from
    # an Input source to the Tester.
    #
    # options - The Hash specifying the input options:
    #           :input  - The String input matching the expected output.
    #           :output - The String expected output from the program for the
    #                     associated input.
    #           :name   - The String name of the input, this is usually the
    #                     number of the test relative to the others, and should be
    #                     provided by the source.
    #
    def initialize(options)
      @options = options
    end

    # Public: Returns the name of the input/output pair.
    def name
      @options[:name].strip
    end

    # Public: Returns the formatted input.
    def input
      @options[:input].strip
    end

    # Public: Returns the formatted expected output.
    def output
      @options[:output].strip
    end
  end
end
