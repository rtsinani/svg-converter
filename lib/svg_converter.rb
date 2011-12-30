module SvgConverter
  mattr_accessor :batik
  mattr_accessor :temp_dir
  @@batik = nil
  @@temp_dir = nil

  def self.clear
    %x[rm "#{temp_dir}"/*.*]
  end
  
  class Engine < Rails::Engine
    config.svg_converter = SvgConverter
  end
  
  
  class Convertion
    def initialize (svg, mime_type, width = nil)
      @mime_type = mime_type
      @width = width
      create_svg_file(svg)
      create_file_path()
      @result = nil
    end
    
    def perform
      if @width
        output = %x[java -jar "#{SvgConverter.batik}" -m "#{@mime_type}" -d "#{@output_file}" -w "#{@width}" "#{@svg_filename}"]
      else
        output = %x[java -jar "#{SvgConverter.batik}" -m "#{@mime_type}" -d "#{@output_file}" "#{@svg_filename}"]
      end
      @result = {
        'filename' => File.exists?(@output_file) ? @output_file : '',
        'output'   => output
      }
      return @result
    end
    
    def create_svg_file (svg)
      svg_file = Tempfile.new(['random', '.svg'], SvgConverter.temp_dir)
      svg_file.puts(svg)
      @svg_filename = svg_file.path
    end
    
    def create_file_path
      filename = File.basename(@svg_filename, '.*') 
      @output_file = File.join(SvgConverter.temp_dir, filename) + extension
    end
    
    def extension
      "." + @mime_type.split('/')[1]
    end
    
  end
end