module Testrus
  class Tester
    module Formatter
      class Default
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
        # test - The Test containing information about the test run, such as
        #        name, the input and the expected output.
        #
        # Returns nothing useful.
        def self.report(run)
          puts run.test.name

          if run.passed?
            puts "OK"
          else
            puts "NOT OK"
          end
        end
      end
    end
  end
end
