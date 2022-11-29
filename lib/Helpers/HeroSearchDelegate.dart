// ignore_for_file: file_names
import 'package:super_hero/Helpers/exportsClass.dart';

class HeroSearchDelegate extends SearchDelegate {
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
    return const Text("Hola buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        height: 250,
        child: Center(child: Image.asset("images/hereo.png")),
      );
    }

    return Center(
      child: Text("Aquí implementar tu logica de buscar personaje '$query'"),
    );
  }
}
