module Testrus
  class Runner
    class Run
      attr_reader :output, :test

      # Responsible for extracting data from the run of the program. See the
      # public methods for what information can be extracted. This class only
      # reads output that is run with the command: `/usr/bin/time -l
      # #{program}`. 
      #
      # TODO: Test if this runner works on all UNIX-based operating systems, or
      # only OS X.
      #
      # output - The String output from the command `/usr/bin/time -l program`
      # test   - The Test that the input origins from.
      def initialize(output, test)
        @output = output
        @test = test
      end

      # Public: Extracts the memory usage from the output.
      def memory_usage
        bytes_to_mb(raw_memory_usage)
      end

      # Public: Extracts the real time from the output.
      def real_time
        time "real"
      end

      # Public: Extracts the user time from the output.
      def user_time
        time "user"
      end

      # Public: Extracts the sys time from the output.
      def sys_time
        time "sys"
      end

      # Public: Boolean value of whether the test passed.
      def passed?
        output == @test.expected_output
      end

      # Public: Within usual constraints for time and memory
      def within_constraints?
        memory_usage <= 64.00 && real_time <= 1.00
      end

      # Public: Extracts the output against the input from the entire output
      # which also inclues the time and memory information.
      def output
        @output.split("\n")[0..-16].join("\n").strip
      end

      private
      def raw_memory_usage
        @output.match(/(\d+)\s+maximum/)[1].to_f
      end

      def bytes_to_mb(bytes)
        bytes / (2 << 20)
      end

      def time(type)
        @output.match(/(\d+\.\d+)\s+#{type}/)[1].to_f
      end
    end
  end
end
