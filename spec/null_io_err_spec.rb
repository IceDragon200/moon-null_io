require 'spec_helper'
require 'moon-null_io/null_io'

describe NullIO::ERR do
  subject(:io) { NullIO::ERR }

  it 'is write only' do
    io.puts('Hi')

    expect { io.read }.to raise_error(IOError)
  end
end
