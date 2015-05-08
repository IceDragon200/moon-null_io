require 'spec_helper'
require 'moon-null_io/null_io'

describe NullIO do
  subject(:io) { @io ||= NullIO.new(-1, 'rw') }

  context '#close' do
    it 'closes a stream' do
      myio = NullIO.new(-1, 'rw')
      myio.close
      expect(myio).to be_closed
    end
  end

  context '#binmode' do
    it 'creates a binary stream' do
      myio = NullIO.new(-1, 'rw')
      expect(myio).not_to be_binmode
      myio = myio.binmode
      expect(myio).to be_binmode
    end
  end

  context '#write' do
    it 'writes given objects' do
      expect(io.write('Hi')).to eq(2)
    end
  end

  context '#print' do
    it 'prints given objects' do
      io.print('Hello World', 1, 2, [], {})
    end
  end

  context '#puts' do
    # this is a lie in NullIOs case
    it 'prints given objects appended with record seperator' do
      io.puts('Hello World')
    end
  end

  context '#<<' do
    it 'writes given object' do
      io << 'Hello World' << 'Derp'
    end
  end

  context '#read' do
    it 'reads from the io' do
      expect(io.read).to eq('')
    end
  end

  context '#flush' do
    it 'flushes the io' do
      expect(io.flush).to equal(io)
    end
  end
end
