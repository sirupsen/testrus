module Testrus
  class Input
    class File
      def input
        input_files.map do |input|
          Input.new input:  ::File.read(input),
                    output: ::File.read(output_from_input(input)),
                    name:   name_from_file_name(input)
        end
      end

      private
      def input_files 
        @input_files ||= files("input.*")
      end

      def output_files
        @output_files ||= files("output.*")
      end

      def files(wildcard)
        Dir[wildcard].map { |file| ::File.expand_path(file) }
      end

      def output_from_input(input)
        output_files.find do |output|
          name_from_file_name(input) == name_from_file_name(output)
        end
      end

      def name_from_file_name(input)
        input.match(/\d+$/)[0]
      end
    end
  end
end
