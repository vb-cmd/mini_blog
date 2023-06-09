module SelectData
  def select_only_updated_and_id
    self.select(:updated_at, :id)
  end
end
