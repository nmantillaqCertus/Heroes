import 'package:super_hero/Helpers/exportsClass.dart';

class ScreenDetailHero extends StatelessWidget {
  const ScreenDetailHero({super.key});

  @override
  Widget build(BuildContext context) {
    final hereoRecibido = ModalRoute.of(context)?.settings.arguments.toString();

    return Scaffold(
        appBar: AppBar(
          title: Text(hereoRecibido.toString()),
        ),
        body: Text(hereoRecibido.toString()));
  }
}
