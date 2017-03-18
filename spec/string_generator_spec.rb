require "spec_helper"

RSpec.describe Girbot::StringGenerator do
  let(:string_generator) { Girbot::StringGenerator.new }

  it 'returns all possibilities' do
    string_generator.items = [1]

    expect(string_generator.repeated_permutation_with_length(0)).to eq []
    expect(string_generator.repeated_permutation_with_length(1)).to eq ['1']
    expect(string_generator.repeated_permutation_with_length(2)).to eq ['11']

    string_generator.items = [1, 2]
    expect(string_generator.repeated_permutation_with_length(0)).to eq []
    expect(string_generator.repeated_permutation_with_length(1)).to eq ['1', '2']
    expect(string_generator.repeated_permutation_with_length(2)).to eq ['11', '12', '21', '22']

    expect(string_generator.repeated_permutation).to eq ['1', '2', '11', '12', '21', '22']

    # string_generator = Girbot::StringGenerator.new
    # File.open('generated', 'a') do |file|
      # string_generator.repeated_permutation(2, 5).each do |line|
        # file.puts line
      # end
    # end
  end
end
