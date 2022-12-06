// ignore_for_file: file_names
import 'package:super_hero/Helpers/exportsClass.dart';

class HeroSearchDelegate extends SearchDelegate {
  late Future<List<HeroFinal>> heroesObtenidosSearch;
  @override
  String get searchFieldLabel => "Encuentra a tu hereo favorito";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        height: 250,
        child: Center(child: Image.asset("images/hereo.png")),
      );
    } else {
      heroesObtenidosSearch = Service.heroesObtenidos(query);
      return FutureBuilder(
        future: heroesObtenidosSearch,
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
      );
    }
  }
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
