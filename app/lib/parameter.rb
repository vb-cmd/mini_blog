module Parameter
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
