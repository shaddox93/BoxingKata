require "spec_helper"

RSpec.describe Boxing::Kata do
  it "has a version number" do
    expect(Boxing::Kata::VERSION).not_to be nil
  end

 #it "does something useful" do
 #   expect(false).to eq(true)
 # end
end

=begin
RSpec.describe Boxing::Kata::Family do
  #aggregate_failures
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
=end
RSpec.describe Boxing::Kata::Box do
  def box(params = {})
    defaults = {
      brushCount: :brushCount,
      boxContents: :boxContents,
    }

    box.new(**defaults.merge(params))
  end

  it 'has brush count' do
  end

  it 'has brushes' do
  end

  it 'when adding a brush to the box' do
  end

  it 'when printing a full box' do
  end

  it 'when printing a partial box' do
  end

  it '.full?' do
  end

  it '.notEmpty?' do
  end
end