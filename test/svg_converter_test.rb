require 'test_helper'

class SvgConverterTest < ActiveSupport::TestCase
  setup do
    # Path to the batik jar
    SvgConverter.batik = '/Users/panjon/dev/batik/batik-1.7/batik-rasterizer.jar'
    current_dir = File.dirname(__FILE__)
    SvgConverter.temp_dir = current_dir.gsub('/test', '/tmp')
    @svg_filename = File.join(current_dir, 'samples/areaspline.svg')
  end
  
  ['image/png', 'image/jpg', 'application/pdf'].each do |mime_type|
     test "can convert to #{mime_type}" do
       svg = File.new(@svg_filename).readlines
       convertion = SvgConverter::Convertion.new(svg, mime_type, 200)
       result = convertion.perform
       assert_match 'success', result['output']
       assert File.exists?(result['filename'])
     end
   end
  
end
