# frozen_string_literal: true

require_relative '../room'

RSpec.describe Room do
  # .new is class method
  describe '.new' do
    context 'invalid arguments' do
      it 'raises an ArgumentError' do
        expect { Room.new }.to raise_error(ArgumentError)
      end
    end

    context 'valid arguments' do
      it 'returns an instance of Room' do
        room = Room.new('Spooky Room', 'A large, dimly lit room.')
        expect(room).to be_an_instance_of(Room)
      end
    end
  end

  # #describe is instance method
  describe '#describe' do
    let(:room) { Room.new('Study', 'A smartly arranged library with a globe in the corner.') }

    it 'returns a string' do
      expect(room.describe).to be_an_instance_of(String)
    end

    it 'includes the room name' do
      expect(room.describe).to match(/Study/)
    end

    it 'includes the room description' do
      expect(room.describe).to match(/A smartly arranged library with a globe in the corner\./)
    end
  end

  describe '#neighbors' do
    let(:room) { Room.new('Kitchen', 'A messy bachelor must live here.') }

    context 'the Room has neighbors' do
      before do
        room.map = double
        north = Room.new('North Room', 'It is cold')
        south = Room.new('South Room', 'It is hot')
        allow(room.map).to receive(:neighbors).and_return([{ north: north }, { south: south }])
      end

      it 'returns a Hash' do
        expect(room.neighbors).to be_an_instance_of(Hash)
      end

      it 'returns a Hash with Symbols as keys' do
        expect(room.neighbors.keys.first).to be_an_instance_of(Symbol)
      end

      it 'returns a Hash with Rooms as values' do
        expect(room.neighbors.values.first).to be_an_instance_of(Room)
      end
    end

    context 'the Room has no neighbors' do
      before do
        room.map = double
        allow(room.map).to receive(:neighbors).and_return([])
      end

      it 'returns a Hash' do
        expect(room.neighbors).to be_an_instance_of(Hash)
      end

      it 'returns zero neighbors' do
        expect(room.neighbors.length).to eq(0)
      end
    end
  end
end
