import 'package:flutter/material.dart';
import 'package:rocket/common/widgets/appbar/rocket_appbar.dart';
import 'package:rocket/common/widgets/backgrounds/background.dart';
import 'package:rocket/common/widgets/listtile/rocket_list_tile.dart';
import 'package:rocket/features/rocket/exoplanet/ui/exoplanetdetail.dart';

class Exoplanet extends StatelessWidget {
  const Exoplanet({super.key});

  void _navigateToDetail(BuildContext context, String title, String description) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExoplanetDetail(title: title, description: description),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RocketAppbar(title: "Exoplanets"),
      body: Background(
        child: ListView(
          children: [
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _navigateToDetail(context, "Proxima Centauri b", "Proxima Centauri b is the closest known exoplanet to Earth, orbiting the red dwarf star Proxima Centauri in the Alpha Centauri star system. It lies within the star’s habitable zone, the region where liquid water could potentially exist on the planet’s surface. The planet is about 1.17 times the mass of Earth and completes an orbit in just 11.2 days. However, due to its proximity to a flare-active star, Proxima b may face challenges for habitability, including radiation exposure."),
              child: const RocketListTile(title: "Proxima Centauri b"),
            ),
            GestureDetector(
              onTap: () => _navigateToDetail(context, "TRAPPIST-1e", "TRAPPIST-1e is One of the seven rocky planets orbiting the ultracool dwarf star TRAPPIST-1, TRAPPIST-1e stands out as a prime candidate for habitability. It is roughly the same size and mass as Earth and lies within the star’s habitable zone, where temperatures could allow for liquid water on its surface. The system’s proximity to Earth and the possibility of all seven planets hosting some form of atmosphere make TRAPPIST-1 a focal point for studies on exoplanet habitability."),
              child: const RocketListTile(title: "TRAPPIST-1e"),
            ),
            GestureDetector(
              onTap: () => _navigateToDetail(context, "Kepler-22b", "Kepler-22b was the first confirmed planet to be located within the habitable zone of a Sun-like star, making it a landmark discovery. The planet is about 2.4 times the size of Earth and orbits its star every 290 days. While its composition remains uncertain, it could either be a rocky planet with a thick atmosphere or an ocean world. The size and position of Kepler-22b have made it a focal point for studies on super-Earths and habitable worlds."),
              child: const RocketListTile(title: "Kepler-22b"),
            ),
            GestureDetector(
              onTap: () => _navigateToDetail(context, "LHS 1140 b", "LHS 1140 b is a rocky super-Earth that orbits a small red dwarf star in its habitable zone. The planet is about 1.4 times the size of Earth and 6.6 times its mass, suggesting a dense, rocky composition. Its orbit is much longer than other nearby planets, taking about 25 days to complete. Scientists are particularly interested in LHS 1140 b because it’s located in a system where conditions could allow for liquid water, making it a prime candidate for further study regarding life potential."),
              child: const RocketListTile(title: "LHS 1140 b"),
            ),
            GestureDetector(
              onTap: () => _navigateToDetail(context, "HD 209458 b", "One of the first exoplanets where atmospheric composition was detected, HD 209458 b nicknamed Osiris is a hot Jupiter—a gas giant that orbits very close to its star. It has a mass slightly less than Jupiter but is bloated due to the intense heat from its star. Osiris is losing its atmosphere due to the star’s radiation, creating a long tail of escaping gas, much like a comet. This planet’s discovery provided the first direct evidence of atmospheric evaporation on an exoplanet."),
              child: const RocketListTile(title: "HD 209458 b"),
            ),
            GestureDetector(
              onTap: () => _navigateToDetail(context, "K2-18 b", "K2-18 b is a super-Earth exoplanet located approximately 124 light-years away from Earth in the constellation Leo. Discovered by NASA’s K2 mission in 2015, it has garnered attention for its position within the habitable zone of its host star, where conditions might allow for the presence of liquid water."),
              child: const RocketListTile(title: "K2-18 b"),
            ),
            GestureDetector(
              onTap: () => _navigateToDetail(context, "Gliese 667 Cc", "Gliese 667 Cc is a super-Earth orbiting in the habitable zone of the red dwarf star Gliese 667 C, part of a triple star system. This planet is about 4.5 times as massive as Earth and receives similar energy from its star as Earth does from the Sun, suggesting that it could host liquid water. Its location in a nearby system makes it a key target for future habitability studies and efforts to detect potential biosignatures."),
              child: const RocketListTile(title: "Gliese 667 Cc"),
            ),
            GestureDetector(
              onTap: () => _navigateToDetail(context, "55 Cancri e", "A super-Earth that is about eight times more massive than Earth, 55 Cancri e orbits extremely close to its parent star, completing an orbit in just 18 hours. Due to its proximity, the planet’s surface temperature is scorching, with estimates reaching over 2,000°C. Its unique composition has led some scientists to theorize that it might have a carbon-rich interior, possibly containing vast amounts of diamonds. The planet is tidally locked, meaning one side always faces its star, creating extreme temperature differences."),
              child: const RocketListTile(title: "55 Cancri e"),
            ),
            GestureDetector(
              onTap: () => _navigateToDetail(context, "WASP-121b", "WASP-12b is a hot Jupiter with extreme characteristics. It orbits very close to its star, completing an orbit in just over one Earth day. The planet is so hot that it has a pitch-black appearance, absorbing almost all the light that hits it. WASP-12b is also slowly being torn apart by its host star’s gravitational forces, contributing to its bloated, elongated shape. This planet provides insight into the effects of extreme stellar proximity on exoplanets."),
              child: const RocketListTile(title: "WASP-121b"),
            ),
            GestureDetector(
              onTap: () => _navigateToDetail(context, "GJ 1214 b", "GJ 1214 b is a mini-Neptune, a class of planets larger than Earth but smaller than Neptune, with a thick, cloudy atmosphere. It orbits a red dwarf star and has a short orbital period of just 1.6 days. Its atmosphere is rich in water vapor, leading scientists to hypothesize that GJ 1214 b might be a water world with a deep ocean beneath its thick clouds. Studies of this planet help scientists understand the diverse types of atmospheres exoplanets can have."),
              child: const RocketListTile(title: "GJ 1214 b"),
            ),
          ],
        ),
      ),
    );
  }
}
