require 'spec_helper'
require 'magic_numbers'

RSpec.describe MagicNumbers do

  context 'Creating a new instance' do
    it 'ensures that the argument is an array' do
      expect { described_class.new([[8, 27]]) }.to_not raise_error
    end

    it 'raises ArgumentError if argument is not an array' do
      expect { described_class.new(1) }.to raise_error(ArgumentError)
    end
  end

  describe '#compute_quantity' do
    it 'returns 3 when arguments are [[8,27],[49,49]]' do
      magic_number = described_class.new([[8, 27], [49, 49]])

      expect(magic_number.compute_quantity).to eq(3)
    end

    it 'returns 2 when arguments are [[8,27]]' do
      magic_number = described_class.new([[8, 27]])

      expect(magic_number.compute_quantity).to eq(2)
    end

    it 'returns 1 when arguments are [[49,49]]' do
      magic_number = described_class.new([[49, 49]])

      expect(magic_number.compute_quantity).to eq(1)
    end

    it 'returns 0 when arguments are [[10, 15]]' do
      magic_number = described_class.new([[10, 15]])

      expect(magic_number.compute_quantity).to eq(0)
    end
  end
end
