// ignore_for_file: non_constant_identifier_names

import 'package:super_hero/Helpers/exportsClass.dart';

class ScreenDetailHero extends StatelessWidget {
  const ScreenDetailHero({super.key});

  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;
    final hereoRecibido =
        ModalRoute.of(context)?.settings.arguments as HeroFinal;
    final imgHeroe = hereoRecibido.images!.imgLG;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: alto,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ParteHeader(ancho, alto, hereoRecibido, context),
            parteMedia(ancho, alto, hereoRecibido, context)
          ],
        ),
      ),
    );
  }
}

Widget ParteHeader(
    double ancho, double alto, HeroFinal Heroe, BuildContext context) {
  var altoX = alto * 0.6;
  final imgHeroe = Heroe.images!.imgLG;
  var anchoPowers = 35;
  PowerStats? ps = Heroe.powerstats;
  return Container(
    height: altoX,
    width: ancho,
    padding: EdgeInsets.symmetric(horizontal: ancho * 0.001),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
      image: DecorationImage(
          image: FadeInImage(
            image: NetworkImage(imgHeroe!),
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
            placeholder: const AssetImage("images/SpinnerImg.gif"),
          ).image,
          fit: BoxFit.cover),
    ),
    child: Column(children: [
      const Spacer(
        flex: 3,
      ),
      Container(
        height: altoX * 0.5,
        padding: EdgeInsets.symmetric(vertical: ancho * 0.1),
        margin: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.4),
        ),
        child: Container(
            width: 300,
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  Heroe.name.toString(),
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                Text(
                  Heroe.slug.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Text("Gender ${Heroe.appearance?.gender}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: 20,
                    width: anchoPowers.toDouble(),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.9),
                    ),
                    child: Text(
                      "${ps?.intelligence}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: anchoPowers.toDouble(),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.9),
                    ),
                    child: Text(
                      "${ps?.strength}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: anchoPowers.toDouble(),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.9),
                    ),
                    child: Text(
                      "${ps?.speed}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: anchoPowers.toDouble(),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.9),
                    ),
                    child: Text(
                      "${ps?.durability}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: anchoPowers.toDouble(),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.9),
                    ),
                    child: Text(
                      "${ps?.power}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: anchoPowers.toDouble(),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.9),
                    ),
                    child: Text(
                      "${ps?.combat}",
                      style: const TextStyle(color: Colors.black),
                    ),
                  )
                ])
              ],
            )),
      )
    ]),
  );
}

Widget parteMedia(
    double ancho, double alto, HeroFinal Heroe, BuildContext context) {
  return Positioned(
    bottom: 10,
    left: 10,
    child: Container(
      height: 320,
      width: ancho - 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 10)]),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CarouselSlider(
            options: CarouselOptions(height: 280),
            items: [1, 2, 3, 4].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          switch (i) {
                            case 1:
                              return Column(
                                children: [
                                  const Text("Biografía"),
                                  const SizedBox(height: 20),
                                  Text("${Heroe.biography?.firstAppearance}")
                                ],
                              );
                            case 2:
                              return Column(
                                children: [
                                  const Text("Nivel de Podere"),
                                  const SizedBox(height: 20),
                                  Text(
                                      "Inteligencia: ${Heroe.powerstats?.intelligence}")
                                ],
                              );
                            case 3:
                              return Column(
                                children: [
                                  const Text("Apariencia"),
                                  const SizedBox(height: 20),
                                  Text(
                                      "Color de Ojos: ${Heroe.appearance?.eyeColor}")
                                ],
                              );

                            default:
                              return Column(
                                children: [
                                  const Text("Trabajo"),
                                  const SizedBox(height: 20),
                                  Text("Ocupación: ${Heroe.work?.occupation}"),
                                  const SizedBox(height: 20),
                                  Text("Base: ${Heroe.work?.base}")
                                ],
                              );
                          }
                        },
                      ));
                },
              );
            }).toList(),
          )
        ],
      ),
    ),
  );
}
