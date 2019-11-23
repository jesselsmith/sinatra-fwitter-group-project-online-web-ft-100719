module Concerns::Slugifiable
  def slugify(string)
    string.gsub(/\s/, '-').gsub(/[^\w-]/, '')
  end
end
