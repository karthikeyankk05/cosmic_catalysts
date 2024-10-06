import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rocket/common/widgets/appbar/rocket_appbar.dart';
import 'package:rocket/common/widgets/backgrounds/background.dart';
import 'package:rocket/common/widgets/listtile/rocket_list_tile.dart';
import 'package:rocket/features/rocket/game1/spaceshooter.dart';

class Games extends StatelessWidget {
  const Games({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RocketAppbar(title: "Games"),
      body: Background(
        child: ListView(
          children: [
            const SizedBox(height: 10),
            RocketListTile(
              title: "Space Shooter Game",
              onPressed: () {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                ]);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SpaceShooterGame(), // Navigate to the game
                  ),
                ).then((_) {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                  ]);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
