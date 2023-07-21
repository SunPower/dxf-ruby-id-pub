require 'dxf/parser'

describe DXF::Parser do
  puts "must read from IO stream"
  it 'must read file containing Polyline' do
    parser = File.open('test/fixtures/fix.dxf', 'r') {|f| DXF::Parser.new.parse(f) }
      entities = parser.entities
      puts 'entities', entities.class, entities.length, entities
  end
end