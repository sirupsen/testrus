module Testrus
  class Input
    class File
      # Public: Associated the file input and output into Input objects.
      #
      # Returns an Array of Input objects.
      def input
        input_files.map do |input|
          Input.new input:  ::File.read(input),
                    output: ::File.read(output_from_input(input)),
                    name:   name_from_file_name(input)
        end
      end

      private
      # Internal: Finds the input files on the filesystem and expands the paths.
      #
      # Returns an Array of Strings of paths to the input files.
      def input_files 
        @input_files ||= files("input.*")
      end

      # Internal: Finds the output files on the filesystem and expands the paths.
      #
      # Returns an Array of Strings of paths to the output files.
      def output_files
        @output_files ||= files("output.*")
      end

      # Internal: Finds the files with the given wildcard and expands the paths.
      #
      # Returns an Array of Strings of expanded paths.
      def files(wildcard)
        Dir[wildcard].map { |file| ::File.expand_path(file) }
      end

      # Internal: Finds the input file's counterpart in the Array of
      # output_files by querying on the suffix number.
      #
      # Examples
      #   
      #   output_from_input("/home/testrus/input.2")
      #   #=> "/home/testrus/output.2"
      #
      # Returns the full path to the associated output file.
      def output_from_input(input)
        output_files.find do |output|
          name_from_file_name(input) == name_from_file_name(output)
        end
      end

      # Internal: The name of an input or output file is defined as the last
      # number in the path name. This method returns an input or output file's
      # name.
      #
      # path - The String path of the input or output file.
      #
      # Example
      #   
      #   name_from_file_name("/home/testrus/input.2")
      #   #=> "2"
      #
      #   name_from_file_name("/home/testrus/input.ohai.2")
      #   #=> "2"
      #
      # Returns a String name of the input or output file.
      def name_from_file_name(path)
        path.match(/\d+$/)[0]
      end
    end
  end
end
