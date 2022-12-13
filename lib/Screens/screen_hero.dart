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

                      //BASE DE DATOS
                      final heroDBAux = heroDB();
                      heroDBAux.idHero = heroe.id;
                      heroDBAux.name = heroe.name;
                      heroDBAux.occupation = heroe.work!.occupation;
                      heroDBAux.imgLG = heroe.images!.imgLG;

                      //Previo a insertar debe validar si existe el registro a insertar

                      //serviceDB.db.nuevoHeroDB(heroDBAux); Insertar

                      //Obteniendo un elemento
                      /*serviceDB.db
                          .obtenerHeroDBbyId(1)
                          .then((value) => print(value.name));*/

                      //Obteniendo Todos los Elementos
                      serviceDB.db
                          .obtenerHeroDBAll()
                          .then((value) => print(value.length));
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

mostrarDialogo(HeroFinal hereo, BuildContext context) {
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
