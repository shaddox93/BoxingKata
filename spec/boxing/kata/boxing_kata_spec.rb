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
    brushTest = Boxing::Kata::Family.new(brushes: {"blue" => 2, "green" => 3}, contractDate: :"2-12-19")
    raise unless brushTest.brushes.has_key?("blue")
    raise unless brushTest.brushes.has_key?("green")
    raise unless brushTest.brushes.has_value?(2)
    raise unless brushTest.brushes.has_value?(3)
  end

  it 'has a contract start date' do
    raise unless Boxing::Kata::Family.new(brushes: {"blue" => 2, "green" => 3}, contractDate: :"2-12-19").contractDate == :"2-12-19"
  end
end