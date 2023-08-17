require 'dxf/parser'

RSpec.describe DXF::Parser do
  it 'must read file containing Polyline' do
    parser = File.open('test/fixtures/AD_include_polyline.dxf', 'r') {|f| DXF::Parser.new.parse(f) }
    expect(parser.entities.length).to eq(6)
    first = parser.entities.first
    expect(first).to be_a DXF::Line
  end
  it 'must read file NOT containing Polyline' do
    parser = File.open('test/fixtures/AD_only_lines.dxf', 'r') {|f| DXF::Parser.new.parse(f) }
    expect(parser.entities.length).to eq(5)
    first = parser.entities.first
    expect(first).to be_a DXF::Line
  end
end
