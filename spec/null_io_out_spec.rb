require 'spec_helper'
require 'moon-null_io/null_io'

describe NullIO::OUT do
  subject(:io) { NullIO::OUT }

  it 'is write only' do
    io.puts('Hi')

    expect { io.read }.to raise_error(IOError)
  end
end
