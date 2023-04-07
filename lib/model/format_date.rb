module FormatDate
  def date_created
    created_at.strftime('%d/%m/%Y')
  end

  def date_updated
    updated_at.strftime('%d/%m/%Y')
  end
end
