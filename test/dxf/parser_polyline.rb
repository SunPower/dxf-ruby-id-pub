require 'dxf/parser'

RSpec.describe DXF::Parser do
  puts "must read from IO stream"
  it 'must read file containing Polyline' do
    parser = File.open('test/fixtures/polyline.dxf', 'r') {|f| DXF::Parser.new.parse(f) }
    expect(parser.entities.length).to eq(6)
    line = parser.entities.first
    expect(line).to be_a DXF::Line
  end
end
