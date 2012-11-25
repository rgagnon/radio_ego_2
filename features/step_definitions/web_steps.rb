#encoding=utf-8
Étantdonné /^que je navigue sur "(.+)"$/ do |page_name|
  visit path_to(page_name)
end