module Base
  def valid?
    errors.empty?
  end

  def errors
    return @errors if defined? @errors

    @errors = []
  end
end
