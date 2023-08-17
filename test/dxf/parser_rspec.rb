require 'dxf/parser'

RSpec.describe DXF::Parser do
  it 'must read file containing Polyline' do
    parser = File.open('test/fixtures/polyline.dxf', 'r') {|f| DXF::Parser.new.parse(f) }
    expect(parser.entities.length).to eq(6)
    line = parser.entities.first
    expect(line).to be_a DXF::Line
  end
  it 'must read file containing Circle' do
    parser = File.open('test/fixtures/real-poly.dxf', 'r') {|f| DXF::Parser.new.parse(f) }
    expect(parser.entities.length).to eq(6)
  end
end
