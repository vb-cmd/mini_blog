module ApplicationHelper
  def pages_navbar
    Page.where(published: true)
  end
end
