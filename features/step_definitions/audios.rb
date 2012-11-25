#encoding=utf-8

Étantdonné /^les audios suivants:$/ do |table|
  Audio.create!(table.hashes)
end

Alors /^la liste "(.*?)" devrait afficher:$/ do |nom_liste, expected_table|
  class_liste_id = class_liste_id(nom_liste)
  find("ul.#{class_liste_id} li")
  section = page.all("ul.#{class_liste_id} li").map do |li|
    [li.text]
  end
  expected_table.diff!(section)
end