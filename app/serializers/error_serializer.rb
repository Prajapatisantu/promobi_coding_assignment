class ErrorSerializer < ActiveModel::Error
  attr_reader :errors, :status

  def initialize(errors, status)
    @errors = errors
    @status = status
  end

  def serialized_json
    return if errors.nil?
    json = {}
    new_hash = errors.to_hash(true).map do |k, v|
      v.map do |msg|
        { id: k, title: msg }
      end
    end.flatten
    json[:status] = status
    json[:errors] = new_hash
    json
  end

end