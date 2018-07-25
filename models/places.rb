class Place
  attr_accessor :city, :age, :category, :accom, :name, :link, :description

  def initialize(city, age, category, accom, name)
    @city=city
    @age=age
    @category=category
    @accom=accom
    @name = name
  end

end