import 'Helpers/exportsClass.dart';

//Ejecutor, dispoarador
void main() {
  runApp(HeroMain());
}

//Widget Principal
class HeroMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HeroRoutes.home_screen,
      routes: HeroRoutes.routes_hero,
    );
  }
}
