require_relative '../map.rb'

RSpec.describe Map do
  describe '.new' do
    context 'valid arguments' do
      it 'returns a new Map' do
        map = Map.new(4,4)

        expect(map).to be_an_instance_of(Map)
      end
    end
  end

  describe '#place_room' do
    let(:map) { Map.new(4,4) }

    context 'invalid location' do
      it 'raises a Map::OutOfBoundsError' do
        expect { map.place_room(5, 5, 'Room') }.to raise_error(Map::OutOfBoundsError)
      end
    end

    context 'valid location' do
      it 'returns the room' do
        expect(map.place_room(0, 0, 'Room')).to eq('Room')
      end
    end
  end

  describe '#get_room' do
    xcontext 'invalid location' do
    end

    context 'empty location' do
      let(:map) { Map.new(4, 4) }

      it 'returns nil' do
        expect(map.get_room(0, 0)).to eq(nil)
      end
    end

    context 'occupied location' do
      let(:map) do
        map = Map.new(4, 4)
        map.place_room(0, 0, 'Room')
        map
      end

      it 'returns the room' do
        expect(map.get_room(0, 0)).to eq('Room')
      end
    end
  end

  describe '#neighbors' do
    # x to skip and come back to it
    xcontext 'invalid location' do
      xit 'raises a Map::OutOfBoundsError'
    end

    context 'valid location' do
      let(:map) do
        map = Map.new(4, 4)
        map.place_room(1, 0, 'North')
        map.place_room(1, 1, 'Central')
        map.place_room(1, 2, 'South')
        map
      end

      it 'returns the rooms occupying neighboring locations' do
        expect(map.neighbors(1, 1)).to contain_exactly('North', 'South')
      end
    end
  end
end
