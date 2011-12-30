# desc "Explaining what the task does"
# task :svg_converter do
#   # Task goes here
# end

desc "Clear temp files created by SvgConverter"
task :clear do
  SvgConverter.temp_dir = '/Users/panjon/ror/svg_converter/tmp'
  SvgConverter.clear
end
