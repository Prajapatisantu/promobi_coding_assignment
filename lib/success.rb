class Success
  attr_reader :msg, :status, :code

  def initialize(msg, status, code)
    @msg = msg
    @status = status
    @code = code
  end

  def serialized_json
    {
      status: status,
      message: msg,
      code: code
    }
  end
end