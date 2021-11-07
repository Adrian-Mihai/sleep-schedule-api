module FileHelpers
  private

  def extension(file)
    file.content_type.split('/').last
  end
end
