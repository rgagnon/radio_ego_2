module UtilHelpers

  def path_to(page_name)
    return '/' if page_name == "home page"
  end

  def class_liste_id(nom_liste)
    return 'most_heard' if nom_liste == "des plus entendus"
  end

end

World(UtilHelpers)
