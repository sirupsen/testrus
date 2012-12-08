require 'colored'

module Testrus
  class Tester
    module Formatter
      class Default
        attr_reader :run

        # Public: The formatter is responsible for reporting the run data to the
        # user. New formatters can easily be added here. The layout of this
        # formatter should be used for guidance on how to create new formatters.
        # Also see the documentation for Run and the sources to find what
        # information is available to the formatter.
        #
        # The formatter does not return anything useful, it is simply used to
        # report to the user. The default formatter simply reports to STDOUT.
        #
        #
        # run  - The Run containing the run data (memory usage, output, cpu time,
        #        etc.)
        def initialize(run)
          @run = run
        end

        # Public: Creates the actual report.
        def report
          run.passed? && run.within_constraints? ? report_success : report_failure
        end

        private
        # Internal: Prints the header in the appropriate color.
        def header(color)
          puts "---> Test #{run.test.name} (#{run.real_time}s, #{run.memory_usage})".send(color)
        end

        # Internal: Test passed. 
        def report_success
          header :green
        end

        # Internal: Test failed.
        def report_failure
          header :red

          puts "Input".yellow
          puts "#{run.test.input}\n\n"

          puts "Expected".yellow
          puts "#{run.test.output}\n\n"

          puts "Output".yellow
          puts "#{run.output}"
        end
      end
    end
  end
end
