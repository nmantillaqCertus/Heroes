import 'package:super_hero/Helpers/exportsClass.dart';

class ScreenDetailHero extends StatelessWidget {
  const ScreenDetailHero({super.key});

  @override
  Widget build(BuildContext context) {
    final hereoRecibido =
        ModalRoute.of(context)?.settings.arguments as HeroFinal;
    final imgHeroe = hereoRecibido.images!.imgMD;

    print(hereoRecibido.work?.occupation);

    return Scaffold(
        appBar: AppBar(
          title: Text(hereoRecibido.name.toString()),
        ),
        body: FadeInImage(
          image: NetworkImage(imgHeroe!),
          placeholder: const AssetImage("images/SpinnerImg.gif"),
        ));
  }
}
