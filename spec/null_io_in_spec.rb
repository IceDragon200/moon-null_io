require 'spec_helper'
require 'moon-null_io/null_io'

describe NullIO::IN do
  subject(:io) { NullIO::IN }

  it 'is read only' do
    expect { io.puts('Hi') }.to raise_error(IOError)
    io.read
  end
end
