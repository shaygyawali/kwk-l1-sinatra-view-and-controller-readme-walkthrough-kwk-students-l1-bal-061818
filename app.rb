require_relative 'config/environment'
require_relative 'models/places'


class App < Sinatra::Base
  get '/' do
  erb :index
  end
  
 

  get '/understand' do 
    erb :understand
  end
  
  get '/explore' do
    erb :explore
  end
  
  get '/recommendations' do
    erb :recommendations
  end
  
  
  post '/explore' do
    bway = Place.new(["NYC"], ["kid", "teen", "adult"], "entertainment", ["noise", "sensory"], "Broadway's Autism-Friendly Performances")
    bway.link = "https://www.tdf.org/nyc/40/Autism-Theatre-Initiative-TDF-Theatre-Accessibility-Program-Tap"
    bway.description = "Bring the family to Broadway! Enjoy some Broadway shows during their special autism-friendly performances! Factors like lighting and sound design are altered to cater to those with sensory issues."
    sensory_room = Place.new(["NYC"], ["kid", "teen"], "entertainment", ["noise", "crowds", "sensory", "attention"], "The Sensory Room at Brooklyn's Children Museum")
    sensory_room.link = "https://www.brooklynkids.org/exhibit/sensory-room/"
    sensory_room.description = "Kids will love the Sensory Room located in Brooklyn's Children Museum! The room provides kids with hands-on experiences where they can relax, play, and have fun!"
    bounce_u = Place.new(["NYC"], ["kid", "teen"], "entertainment", ["noise", "sensory", "crowds", "attention"], "Bounce U")
    bounce_u.link = "https://www.bounceu.com/brooklyn-ny/"
    bounce_u.description = "This place in Brooklyn provides a high-energy environment full of inflatables for kids to play!"

    #LA
    lemon_tree = Place.new(["LA"], ["kid"], "food", ["noise", "sensory", "attention"], "Lemon Tree Kid and Family Cafe")
    lemon_tree.link = "http://lemontreekidscafe.com/"
    lemon_tree.description = "This cafe is family-friendly and has a merry-go-round and other fun activites to enjoy!"
    gentle_barn = Place.new(["LA"], ["kid", "teen", "adult"], "entertainment", ["noise", "crowds", "sensory", "attention"], "The Gentle Barn")
    gentle_barn.link = "https://www.gentlebarn.org/"
    gentle_barn.description = "Gentle barn is dedicated to raising enviornmental awareness through soothing animal therapy and plenty of opportunities to
    sponor animals."
    gymnastics = Place.new(["LA"], ["kid", "teen"], "entertainment", ["noise", "sesnory", "crowds", "attention"], "Los Angeles School of Gymnastics")
    gymnastics.link = "http://www.lagymnastics.com/special-needs-program-at-lasg/"
    gymnastics.description = "Love to play and move? The LA School of Gymnastics offers a program for people with special needs Using the 'Sensory Diet' approach, the program emphasizes interaction with the senses for a therapetic and fun experience for kids and teens!"

    #Baltimore
    md_sci = Place.new(["Baltimore"], ["kid", "teen"], "entertainment", ["noise", "crowds", "sensory", "attention"], "The Maryland Science Center")
    md_sci.link = "http://www.mdsci.org/"
    md_sci.description = "The Maryland Science Center provides a hands on learning experience for people of all ages to enjoy. Learn about science
    through interactive exhibits or self_directed reading guides"
    alex_tavern = Place.new(["Baltimore"], ["kid", "teen", "adult"], "food", ["noise", "crowds", "attention"], "Alexander's Tavern")
    alex_tavern.link = "http://www.alexanderstavern.com/"
    alex_tavern.description = "Alexander's Tavern serves deli food items and has a quiet area that is secluded from loud noises, which is perfect for those who would like to avoid crowds and a loud environment."

    amc = Place.new(["NYC", "LA", "Baltimore"], ["kid", "teen", "adult"], "entertainment", ["noise", "crowds""sensory"], "AMC's Sensory Friendly Film Screenings")
    amc.link = "https://www.amctheatres.com/programs/sensory-friendly-films"
    amc.description = "Look out for AMC theaters special sensory-sensitive screenings."


    @places = [bway, sensory_room, lemon_tree, gentle_barn, md_sci, alex_tavern, amc]
    @city = params["city"]
    @age = params["age"]
    @category = params["category"]
    @accom = []
    puts params
    params.each do |key, value|
      if key == "noise" || key == "sensory" || key == "crowds" || key == "attention"
        @accom.push(key)
      end
    end
    puts @accom

    erb :recommendations
  end

end



  
  
  
  
  
  
  

