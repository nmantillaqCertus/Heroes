// ignore_for_file: prefer_initializing_formals

import '../Helpers/exportsClass.dart';

class HeroFinal {
  late int? id;
  late String? name;
  late String? slug;
  late PowerStats? powerstats;
  late Appearance? appearance;
  late Biography? biography;
  late Work? work;
  late Images? images;

  HeroFinal(id, name, slug, powerstats, appearance, biography, work, images) {
    this.id = id;
    this.name = name;
    this.slug = slug;
    this.powerstats = powerstats;
    this.appearance = appearance;
    this.biography = biography;
    this.work = work;
    this.images = images;
  }
}
