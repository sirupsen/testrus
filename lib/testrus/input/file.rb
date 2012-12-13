module Testrus
  class Input
    class File
      # Public: Create a new Input::File object to handle file sources for input
      # and output.
      #
      # context - The Hash specifying context:
      #           :pwd - Working directory for the file source.
      #
      def initialize(context = {})
        @context = context
      end

      # Public: The working directory of the file input source.
      #
      # Returns the String of the working directory.
      def pwd
        @pwd ||= @context[:pwd].nil? || @context[:pwd].empty? ? default_pwd : @context[:pwd]
      end

      # Public: Associated the file input and output into Input objects, also
      # caches it so we do not repeat this relatively costly operation on the
      # file system.
      #
      # Returns an Array of Input objects.
      def input
        @input ||= input_files.map do |input|
          Input.new input:  ::File.read(input),
                    output: ::File.read(output_from_input(input)),
                    name:   test_name_from_file_name(input)
        end
      end
      alias_method :tests, :input

      private
      # Internal: Finds the input files on the filesystem and expands the paths.
      #
      # Returns an Array of Strings of paths to the input files.
      def input_files 
        @input_files ||= files("*in*[0-9]*")
      end

      # Internal: Finds the output files on the filesystem and expands the paths.
      #
      # Returns an Array of Strings of paths to the output files.
      def output_files
        @output_files ||= files("*out*[0-9]*")
      end

      # Internal: Finds the files with the given wildcard and expands the paths.
      #
      # Returns an Array of Strings of expanded paths.
      def files(wildcard)
        Dir["#{pwd}/#{wildcard}"].map { |file| ::File.expand_path(file) }
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
          id_from_file_name(input) == id_from_file_name(output)
        end
      end

      # Internal: The id of an input or output file is defined as the last
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
      def id_from_file_name(path)
        path.match(/\d+$/)[0]
      end
      alias_method :test_name_from_file_name, :id_from_file_name

      # Internal: Default working directory if none was passed.
      #
      # Returns the String path of the working directory.
      def default_pwd
        `pwd`.strip 
      end
    end
  end
end
