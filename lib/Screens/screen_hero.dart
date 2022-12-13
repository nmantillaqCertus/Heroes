// ignore_for_file: unused_import

import '../Helpers/exportsClass.dart';
import 'package:http/http.dart' as http;

class ScreenHero extends StatefulWidget {
  const ScreenHero({super.key});

  @override
  State<ScreenHero> createState() => _ScreenHeroState();
}

class _ScreenHeroState extends State<ScreenHero> {
  late Future<List<HeroFinal>> heroesObtenidos;
  String argumento = "";

  @override
  void initState() {
    super.initState();
    heroesObtenidos = Service.heroesObtenidos(argumento);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Pantalla del Heroe"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return HeroesVistos(context);
                    },
                  );
                },
                icon: const Icon(Icons.all_inbox))
          ],
          leading: IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: HeroSearchDelegate()),
              icon: const Icon(Icons.search))),
      body: FutureBuilder(
        future: heroesObtenidos,
        builder: (context, heroes) {
          if (heroes.hasData) {
            return ListView(
              children: listaHeroesS(heroes.data!, context),
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

  List<Widget> listaHeroesS(List<HeroFinal> heroesData, BuildContext context) {
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 8),
                  Text(nombreHeroe),
                  const SizedBox(width: 8)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const Text("Ver"),
                    onPressed: () {
                      //Muestre un modal pop up
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return mostrarDialogo(heroe, context);
                        },
                      );
                    },
                  ),
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

FutureBuilder HeroesVistos(BuildContext context) {
  Future<List<heroDB>> heroesVistos = serviceDB.db.obtenerHeroDBAll();
  return FutureBuilder(
    future: heroesVistos,
    builder: (context, heroes) {
      if (heroes.hasData) {
        return ListView(
          children: listaHeroesVistos(heroes.data!, context),
        );
      } else if (heroes.hasError) {
        return const Text("No se encontraron heroes");
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

List<Widget> listaHeroesVistos(List<heroDB> heroesData, BuildContext context) {
  List<Widget> heroes = [];

  for (var heroe in heroesData) {
    var nombreHeroe = heroe.name.toString();
    var imgHereo = heroe.imgLG;
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
            ),
          ],
        ),
      ),
    ));
  }

  return heroes;
}

mostrarDialogo(HeroFinal hereo, BuildContext context) {
  //BASE DE DATOS
  final heroDBAux = heroDB();
  heroDBAux.idHero = hereo.id;
  heroDBAux.name = hereo.name;
  heroDBAux.occupation = hereo.work!.occupation;
  heroDBAux.imgLG = hereo.images!.imgLG;

  serviceDB.db.obtenerHeroDBbyId(hereo.id).then((value) => {
        if (value == null) {serviceDB.db.nuevoHeroDB(heroDBAux)},
      });

  return AlertDialog(
    title: Text(hereo.name!),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(hereo.biography!.fullName!),
        const SizedBox(
          height: 10,
        ),
        Text(hereo.work!.occupation!)
      ],
    ),
    actions: [
      TextButton(
          onPressed: () {
            //Implementar Logica para Guardar en DB

            Navigator.pop(context);
          },
          child: const Text("Cerrar"))
    ],
  );
}
