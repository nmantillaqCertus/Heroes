import '../Helpers/exportsClass.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
// ignore: unused_import

class ScreenHero extends StatefulWidget {
  const ScreenHero({super.key});

  @override
  State<ScreenHero> createState() => _ScreenHeroState();
}

class _ScreenHeroState extends State<ScreenHero> {
  late Future<List<HeroFinal>> heroesObtenidos;

  @override
  void initState() {
    super.initState();
    heroesObtenidos = Service.heroesObtenidos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pantalla del Heroe"),
      ),
      body: FutureBuilder(
        future: heroesObtenidos,
        builder: (context, heroes) {
          if (heroes.hasData) {
            return ListView(
              children: listaHeroes(heroes.data!),
            );
          } else if (heroes.hasError) {
            return const Text("No se encontraron heroes");
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  List<Widget> listaHeroes(List<HeroFinal> heroesData) {
    List<Widget> heroes = [];

    for (var heroe in heroesData) {
      var nombreHeroe = heroe.name.toString();
      var imgHereo = heroe.images!.imgLG;
      heroes.add(Center(
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: FadeInImage(
                  image: NetworkImage(imgHereo!),
                  placeholder: const AssetImage("images/SpinnerImg.gif"),
                ),
                title: Text(nombreHeroe),
              ), //CircleAvatar

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(width: 8),
                  Text(nombreHeroe),
                  const SizedBox(width: 8)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('más info'),
                    onPressed: () {
                      Navigator.pushNamed(context, "Pantalla_Detalle",
                          arguments: heroe);
                    },
                  ),
                  const SizedBox(width: 8)
                ],
              ),
            ],
          ),
        ),
      ));
    }

    return heroes;
  }
}
