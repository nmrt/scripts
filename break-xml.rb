require 'rubygems'
require 'xmlsimple'

xml = nil
file = ARGV[0]
file_basename = File.basename( file, File.extname(file))
out_dir = File.join( ARGV[1], file_basename )
out_options = {
  'XmlDeclaration' => true ,
  'RootName' => 'item' ,
  'OutputFile' => nil ,
}

puts(" === #{file_basename.upcase} === ")
xml = XmlSimple.xml_in(file)
#begin
#rescue
#end

unless File.exists?(out_dir)
  Dir.mkdir(out_dir)
end

xml['item'].each_index do |i|
  out_options['OutputFile'] = File.join( out_dir, "item-#{i}.xml" )
  XmlSimple.xml_out( xml['item'][i], out_options )
  puts("#{out_options['OutputFile']}: done")
end
