module SelectData
  def select_title_and_ids
    self.select(:id, :title).map { |post| [post.title, post.id] }
  end
end
