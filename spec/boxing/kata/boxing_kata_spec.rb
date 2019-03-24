require "spec_helper"

RSpec.describe Boxing::Kata do
  it "has a version number" do
    expect(Boxing::Kata::VERSION).not_to be nil
  end

 #it "does something useful" do
 #   expect(false).to eq(true)
 # end
end

RSpec.describe Boxing::Kata::Family do
  it 'has brush data' do
    brushTest = Boxing::Kata::Family.new({"blue" => 2, "green" => 3}, "2-12-19")
    expect(brushTest.brushes.has_key?("blue")).to eq(true)
  end

  it 'has a contract start date' do
    brushTest = Boxing::Kata::Family.new({"blue" => 2, "green" => 3}, "2-12-19")
    expect(brushTest.contractDate).not_to be nil
  end
end

RSpec.describe Boxing::Kata::Box do
  it 'has brush count' do
    boxTest = Boxing::Kata::Box.new(4)
    expect(boxTest.brushCount).to eq(0)

    boxTest.add("green")
    boxTest.add("green")
    expect(boxTest.brushCount).to eq(2)
  end

  it 'when adding a brush to the box' do
    boxTest = Boxing::Kata::Box.new(2)
    boxTest.add("pink")
    expect(boxTest.boxContents.has_key?("pink")).to eq(true)
  end

  it '.full?' do
    boxTest = Boxing::Kata::Box.new(2)
    expect(boxTest.full?).to eq(false)

    boxTest.add("blue")
    boxTest.add("green")
    expect(boxTest.full?).to eq(true)
  end

  it '.notEmpty?' do
    boxTest = Boxing::Kata::Box.new(2)
    expect(boxTest.notEmpty?).to eq(false)
  end
end