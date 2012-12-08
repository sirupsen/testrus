module Testrus
  class Tester
    attr_reader :options

    # Internal: Defines the relationship between input sources and their
    # corresponding class names.
    SOURCES = {
      :file => Testrus::Input::File
    }

    # Internal: Defines the formatters to allow specifying a custom formatter in
    # the options.
    FORMATTERS = {
      :default => Formatter::Default
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
      @options = default_options.merge(options)
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

    # Public: Returns the formatter class.
    def formatter
      FORMATTERS[@options[:formatter]]
    end

    # Public: Runs the input from the source against the runner. Return the
    # results to the formatter.
    def run
      source.tests.each do |test|
        formatter.report runner.run(test)
      end
    end

    private

    # Internal: Defines the default options that are overriden by the options
    # passed to initialize.
    def default_options
      {
        :formatter => :default,
        :source => :file
      }
    end
  end
end
