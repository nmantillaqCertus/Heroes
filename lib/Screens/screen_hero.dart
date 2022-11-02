import '../Helpers/exportsClass.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

class ScreenHero extends StatefulWidget {
  const ScreenHero({super.key});

  @override
  State<ScreenHero> createState() => _ScreenHeroState();
}

class _ScreenHeroState extends State<ScreenHero> {
  Future<List<HeroFinal>> heroesObtenidos() async {
    //Se realizará una llamada a la API
    //Obtendras un objeto => proceso
    var uriAPIHero =
        Uri.parse("https://akabab.github.io/superhero-api/api/all.json");

    final responseHero = await http.get(uriAPIHero);

    print(responseHero.body);

    PowerStats powerstats = PowerStats(123, 45, 12, 45, 78, 45);
    Appearance appearance = Appearance(
        "gender", "race", ["height"], ["weight"], "eyeColor", "hairColor");

    Biography biography = Biography("fullName", "alterEgos", ["aliases"],
        "placeOfBirth", "firstAppearance", "publisher", "alignment");

    Work work = Work("occupation", "base");
    Images images = Images("imgXS", "imgSM", "imgMD", "imgLG");

    final listaHeros = <HeroFinal>[
      HeroFinal(
          1, "name", "slug", powerstats, appearance, biography, work, images)
    ];

    return listaHeros;
  }
  //late heroesObtenidos;

  @override
  void initState() {
    super.initState();

    heroesObtenidos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pantalla del Heroe"),
      ),
      body: ListView(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "Pantalla_Detalle",
                    arguments: "CUALQUIER HEROE");
              },
              child: const Text("Heroe 1"))
        ],
      ),
    );
  }
}
