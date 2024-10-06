class Exoplanet {
  final String name;
  final double distance; // Light years
  final String type;
  final String starType;
  final String description;

  Exoplanet({
    required this.name,
    required this.distance,
    required this.type,
    required this.starType,
    required this.description,
  });
}

class ExoplanetService {
  // Hardcoded list of exoplanets
  final List<Exoplanet> _exoplanets = [
    Exoplanet(
      name: 'Proxima Centauri b',
      distance: 4.24,
      type: 'Rocky',
      starType: 'Red Dwarf',
      description: 'Proxima Centauri b is located in the habitable zone of Proxima Centauri and is roughly similar in size to Earth.',
    ),
    Exoplanet(
      name: 'TRAPPIST-1e',
      distance: 40,
      type: 'Earth-sized',
      starType: 'Ultracool Dwarf',
      description: 'TRAPPIST-1e is one of the seven Earth-sized planets orbiting the star TRAPPIST-1, located in the habitable zone.',
    ),
    Exoplanet(
      name: 'HD 209458 b',
      distance: 159,
      type: 'Hot Jupiter',
      starType: 'G-type',
      description: 'HD 209458 b was the first exoplanet discovered to transit its star and is known for its large size and mass.',
    ),
    Exoplanet(
      name: 'Kepler-22b',
      distance: 600,
      type: 'Super-Earth',
      starType: 'G-type',
      description: 'Kepler-22b is located in the habitable zone of its star and is the first confirmed planet in the habitable zone of a Sun-like star.',
    ),
    Exoplanet(
      name: 'LHS 1140 b',
      distance: 40,
      type: 'Super-Earth',
      starType: 'M-type',
      description: 'LHS 1140 b is a super-Earth exoplanet located 40 light-years away, known for its potential habitability.',
    ),
    Exoplanet(
      name: 'K2-18 b',
      distance: 124,
      type: 'Super-Earth',
      starType: 'K-type',
      description: 'K2-18 b is a super-Earth located in the habitable zone of its star, with a chance of having liquid water.',
    ),
    Exoplanet(
      name: 'Gliese 667 Cc',
      distance: 23.62,
      type: 'Super-Earth',
      starType: 'K-type',
      description: 'Gliese 667 Cc is a super-Earth that lies within the habitable zone of its parent star and has a mass at least 4.5 times that of Earth.',
    ),
    Exoplanet(
      name: '55 Cancri e',
      distance: 40,
      type: 'Super-Earth',
      starType: 'G-type',
      description: '55 Cancri e is a super-Earth exoplanet that orbits the star 55 Cancri A and is believed to be covered in lava.',
    ),
    Exoplanet(
      name: 'WASP-121b',
      distance: 850,
      type: 'Hot Jupiter',
      starType: 'G-type',
      description: 'WASP-121b is a hot Jupiter exoplanet known for its extreme temperatures and cloudy atmosphere.',
    ),
    Exoplanet(
      name: 'GJ 1214 b',
      distance: 40,
      type: 'Super-Earth',
      starType: 'M-type',
      description: 'GJ 1214 b is a super-Earth that orbits the star GJ 1214 and has a thick atmosphere possibly rich in water vapor.',
    ),
  ];

  List<Exoplanet> fetchExoplanets() {
    return _exoplanets;
  }

  String getExoplanetDetails(String name) {
    final exoplanet = _exoplanets.firstWhere(
      (exoplanet) => exoplanet.name.toLowerCase() == name.toLowerCase(),
      orElse: () => Exoplanet(
        name: 'Unknown',
        distance: 0,
        type: 'Unknown',
        starType: 'Unknown',
        description: 'No information available.',
      ),
    );

    return 'Name: ${exoplanet.name}\n'
        'Distance: ${exoplanet.distance} light years\n'
        'Type: ${exoplanet.type}\n'
        'Star Type: ${exoplanet.starType}\n'
        'Description: ${exoplanet.description}';
  }
}
