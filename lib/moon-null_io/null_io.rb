# An IO class stub, this class is intended to be used as a placeholder for
# a class that uses an IO object.
# Example of such classes would be a logger that logs to an IO.
class NullIO
  # @param [Object] fd  file descriptor
  # @param [String] mode
  # @param [Hash] options
  def initialize(fd, mode = 'w+', options = {})
    @fd = fd
    @mode = mode
    @options = options
    @writable = !!(@mode =~ /[w\+a]/)
    @readable = !!(@mode =~ /[r\+]/)
    @binmode = !!(@mode =~ /[b]/)
    @closed = false
  end

  # Is the IO closed?
  #
  # @return [Boolean]
  def closed?
    @closed
  end

  # Checks if the IO is open for operations
  #
  # @raise IOError
  private def check_open
    raise IOError, 'closed stream' if closed?
  end

  # Checks if the IO is open for writing
  #
  # @raise IOError
  private def check_writable
    check_open
    raise IOError, 'not opened for writing' unless @writable
  end

  # Checks if the IO is open for reading
  #
  # @raise IOError
  private def check_readable
    check_open
    raise IOError, 'not opened for reading' unless @readable
  end

  # Closes the IO
  #
  # @return [void]
  def close
    check_open
    @closed = true
  end

  # Sets the IO into binary mode
  #
  # @return [NullIO]
  def binmode
    NullIO.new(@fd, @mode + 'b', @options)
  end

  # Is the IO in binary mode?
  #
  # @return [Boolean]
  def binmode?
    @binmode
  end

  # Writes a string to the stream, in the case of NullIO.
  #
  # @param [Object] args
  # @return [Integer] number of bytes written
  def write(*args)
    check_writable
    args.inject(0) { |acc, o| acc + o.to_s.size }
  end

  # Writes args to the stream.
  #
  # @param [Object] args
  # @return [nil]
  def print(*args)
    write(*args)
    nil
  end

  # (see #print)
  def puts(*args)
    print(*args)
  end

  # Pushes objects into the stream.
  #
  # @param [Object] args
  # @return [self]
  def <<(*args)
    print(*args)
    self
  end

  # Reads values from the stream, in the case of NullIO, an empty string is
  # returned.
  #
  # @return [String] an empty string
  def read
    check_readable
    ''
  end

  # Flushes the stream
  #
  # @return [self]
  def flush(*args)
    check_open
    self
  end

  # STDIN shim
  IN  = new 0, 'r'
  # STDOUT shim
  OUT = new 1, 'w'
  # STDERR shim
  ERR = new 2, 'w'
end
