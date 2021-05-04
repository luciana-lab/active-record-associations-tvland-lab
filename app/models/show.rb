class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network

  def actors_list
    array = []
    show_id = self.characters.map {|show| show.show_id}
    actor_id = self.characters.map {|actor| actor.actor_id}
    array << self.id
    
    if array == show_id && self.actors.ids == actor_id
        list = []
        first_name = self.actors.map {|name| name.first_name}
        last_name = self.actors.map {|name| name.last_name}
        name = first_name + last_name
        list << name.split(",").join(" ")
  end
  end

end