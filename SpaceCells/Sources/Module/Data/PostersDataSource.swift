
import Foundation

typealias PostersDataSourceGetPostersCompletion = (_ data: [Poster]) -> Void

// MARK: Local data source
protocol PostersLocalDataSource {
    func getPosters(completion: PostersDataSourceGetPostersCompletion)
}

class PostersLocalDataSourceImpl {
}

extension PostersLocalDataSourceImpl: PostersLocalDataSource {
    
    func getPosters(completion: PostersDataSourceGetPostersCompletion) {
        
        let posters = [
            Poster(
                title: "The Grand Tour",
                subtitle: "Experience the charm of gravity assists",
                description: "NASA's Voyager mission took advantage of a once-every-175-year alignment of the outer planets for a grand tour of the solar system. The twin spacecraft revealed details about Jupiter, Saturn, Uranus and Neptune – using each planet's gravity to send them on to the next destination. Voyager set the stage for such ambitious orbiter missions as Galileo to Jupiter and Cassini to Saturn. Today both Voyager spacecraft continue to return valuable science from the far reaches of our solar system",
                imageName: "grand_tour"
            ),
            Poster(
                title: "Mars",
                subtitle: "Multiple tours available",
                description: "NASA's Mars Exploration Program seeks to understand whether Mars was, is, or can be a habitable world. Mission like Mars Pathfinder, Mars Exploration Rovers, Mars Science Laboratory and Mars Reconnaissance Orbiter, among many others, have provided important information in understanding of the habitability of Mars. This poster imagines a future day when we have achieved our vision of human exploration of Mars and takes a nostalgic look back at the great imagined milestones of Mars exploration that will someday be celebrated as “historic sites”",
                imageName: "mars"
            ),
            Poster(
                title: "Earth",
                subtitle: "Your oasis in space",
                description: "There's no place like home. Warm, wet and with an atmosphere that's just right, Earth is the only place we know of with life – and lots of it. JPL's Earth science missions monitor our home planet and how it's changing so it can continue to provide a safe haven as we reach deeper into the cosmos",
                imageName: "earth"
            ),
            Poster(
                title: "Venus",
                subtitle: "See you at the Cloud 9 observatory",
                description: "The rare science opportunity of planetary transits has long inspired bold voyages to exotic vantage points – journeys such as James Cook's trek to the South Pacific to watch Venus and Mercury cross the face of the Sun in 1769. Spacecraft now allow us the luxury to study these cosmic crossings at times of our choosing from unique locales across our solar system",
                imageName: "venus"
            ),
            Poster(
                title: "Ceres",
                subtitle: "Queen of the asteroid belt",
                description: "Ceres is the closest dwarf planet to the Sun. It is the largest object in the main asteroid belt between Mars and Jupiter, with an equatorial diameter of about 965 kilometers. After being studied with telescopes for more than two centuries, Ceres became the first dwarf planet to be explored by a spacecraft, when NASA's Dawn probe arrived in orbit in March 2015. Dawn's ongoing detailed observations are revealing intriguing insights into the nature of this mysterious world of ice and rock",
                imageName: "ceres"
            ),
            Poster(
                title: "Jupiter",
                subtitle: "Experience the mighty auroras",
                description: "The Jovian cloudscape boasts the most spectacular light show in the solar system, with northern and southern lights to dazzle even the most jaded space traveler. Jupiter's auroras are hundreds of times more powerful than Earth's, and they form a glowing ring around each pole that's bigger than our home planet. Revolving outside this auroral oval are the glowing, electric “footprints” of Jupiter's three largest moons. NASA's Juno mission will observe Jupiter's auroras from above the polar regions, studying them in a way never before possible",
                imageName: "jupiter"
            ),
            Poster(
                title: "Enceladus",
                subtitle: "Visit beautiful southern",
                description: "The discovery of Enceladus' icy jets and their role in creating Saturn's E-ring is one of the top findings of the Cassini mission to Saturn. Further Cassini mission discoveries revealed strong evidence of a global ocean and the first signs of potential hydrothermal activity beyond Earth – making this tiny Saturnian moon one of the leading locations in the search for possible life beyond Earth",
                imageName: "enceladus"
            ),
            Poster(
                title: "Titan",
                subtitle: "Ride the tides through the throat of Kraken",
                description: "Frigid and alien, yet similar to our own planet billions of years ago, Saturn's largest moon, Titan, has a thick atmosphere, organic-rich chemistry and a surface shaped by rivers and lakes of liquid ethane and methane. Cold winds sculpt vast regions of hydrocarbon-rich dunes. There may even be cryovolcanoes of cold liquid water. NASA's Cassini orbiter was designed to peer through Titan's perpetual haze and unravel the mysteries of this planet-like moon",
                imageName: "titan"
            ),
            Poster(
                title: "Europa",
                subtitle: "Discover life under the ice",
                description: "Astonishing geology and the potential to host the conditions for simple life make Jupiter's moon Europa a fascinating destination for future exploration. Beneath its icy surface, Europa is believed to conceal a global ocean of salty liquid water twice the volume of Earth's oceans. Tugging and flexing from Jupiter's gravity generates enough heat to keep the ocean from freezing. On Earth, wherever we find water, we find life. What will NASA's Europa mission find when it heads for this intriguing moon in the 2020s",
                imageName: "europa"
            ),
            Poster(
                title: "51 Pegasi b", 
                subtitle: "Greetings from your first exoplanet", 
                description: "While there is much debate over which exoplanet discovery is considered the \"first,\" one stands out from the rest. In 1995, scientists discovered 51 Pegasi b, forever changing the way we see the universe and our place in it. The exoplanet is about half the mass of Jupiter, with a seemingly impossible, star-hugging orbit of only 4.2 Earth days. Not only was it the first planet confirmed to orbit a sun-like star, it also ushered in a whole new class of planets called Hot Jupiters: hot, massive planets orbiting closer to their stars than Mercury. Today, powerful observatories like NASA's Kepler space telescope will continue the hunt of distant planets",
                imageName: "51pegasib"
            ),
            Poster(
                title: "HD 40307g", 
                subtitle: "Experience the gravity of a super Earth", 
                description: "Twice as big in volume as the Earth, HD 40307g straddles the line between \"Super-Earth\" and \"mini-Neptune\" and scientists aren't sure if it has a rocky surface or one that's buried beneath thick layers of gas and ice. One thing is certain though: at eight times the Earth's mass, its gravitational pull is much, much stronger",
                imageName: "superearth"
            ),
            Poster(
                title: "Kepler-16b", 
                subtitle: "Where your shadow always has company", 
                description: "Like Luke Skywalker's planet \"Tatooine\" in Star Wars, Kepler-16b orbits a pair of stars. Depicted here as a terrestrial planet, Kepler-16b might also be a gas giant like Saturn. Prospects for life on this unusual world aren't good, as it has a temperature similar to that of dry ice. But the discovery indicates that the movie's iconic double-sunset is anything but science fiction",
                imageName: "kepler16b"
            ),
            Poster(
                title: "Kepler-186f", 
                subtitle: "Where the grass is always redder on the other side", 
                description: "Kepler-186f is the first Earth-size planet discovered in the potentially 'habitable zone' around another star, where liquid water could exist on the planet's surface. Its star is much cooler and redder than our Sun. If plant life does exist on a planet like Kepler-186f, its photosynthesis could have been influenced by the star's red-wavelength photons, making for a color palette that's very different than the greens on Earth. This discovery was made by Kepler, NASA's planet hunting telescope",
                imageName: "kepler186f"
            ),
            Poster(
                title: "PSO J318.5-22", 
                subtitle: "Where the nightlife never ends!", 
                description: "Discovered in October 2013 using direct imaging, PSO J318.5-22 belongs to a special class of planets called rogue, or free-floating, planets. Wandering alone in the galaxy, they do not orbit a parent star. Not much is known about how these planets come to exist, but scientists theorize that they may be either failed stars or planets ejected from very young systems after an encounter with another planet. These rogue planets glow faintly from the heat of their formation. Once they cool down, they will be dancing in the dark",
                imageName: "nightlife"
            )
        ]
        
        completion(posters)
    }
}
