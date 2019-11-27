module ApplicationHelper
  # Pour rajouter la classe active pour un lien courrant
  def current_class?(path)
    return "active" if request.path == path
  end
end
