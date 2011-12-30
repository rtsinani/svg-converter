require 'test_helper'

class SvgConverterTest < ActiveSupport::TestCase
  setup do
    SvgConverter.batik = '/Users/panjon/dev/batik/batik-1.7/batik-rasterizer.jar'
    SvgConverter.temp_dir = '/Users/panjon/ror/svg_converter/tmp'
    @svg_filename = "/Users/panjon/ror/svg_converter/test/samples/areaspline.svg"
  end
  
  ['image/png', 'image/jpg'].each do |mime_type|
    test "can convert to #{mime_type}" do
      svg = File.new(@svg_filename).readlines
      convertion = SvgConverter::Convertion.new(svg, mime_type, 200)
      result = convertion.perform
      assert_match 'success', result['output']
      assert File.exists?(result['filename'])
    end
  end
  
end
