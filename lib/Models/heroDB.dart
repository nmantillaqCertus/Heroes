// ignore_for_file: file_names, camel_case_types, unused_import, depend_on_referenced_packages

import 'package:meta/meta.dart';

class heroDB {
  late int? id;
  late int? idHero;
  late String? name;
  late String? occupation;
  late String? imgLG;

  heroDB({this.id, this.idHero, this.name, this.occupation, this.imgLG});

  factory heroDB.fromJson(Map<String, dynamic> json) => heroDB(
        id: json["id"],
        idHero: json["idHero"],
        name: json["name"],
        occupation: json["occupation"],
        imgLG: json["imgLG"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idHero": idHero,
        "name": name,
        "occupation": occupation,
        "imgLG": imgLG
      };
}
