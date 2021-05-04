class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    self.first_name + " " + self.last_name
  end

  def list_roles
    character = self.characters.map {|name| name.name}
    show = self.shows.map {|name| name.name}
    list_roles = character + show
    list_roles.split(",").join(" - ")
  end

end